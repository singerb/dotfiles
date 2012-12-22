#!/usr/bin/env python

import os
import logging
import argparse
import importlib

class Updater(object):
    def __init__(self, config_file, do_update):
        self.do_update = do_update

        # grab our config from the file
        logging.info("Reading configuration from file '%s'", config_file)
        mod = importlib.import_module(config_file)
        self.config = mod.mapping

        # figure out where this script lives
        self.location = os.path.dirname(os.path.realpath(__file__))
        logging.info("Script located in '%s", self.location)

        # tell the user if we're really running
        if self.do_update:
            logging.info("Performing real update")
        else:
            logging.info("Performing dry-run; nothing will be modified")

    def _backup(self, path):
        backup_name = "%s.bak" % (path,)
        logging.info("Backing up existing file at '%s' to '%s'", path, backup_name);

        if self.do_update:
            os.rename(path, backup_name)

    def _makedirs(self, path):
        logging.info("Creating parent directories for '%s'", path)

        if self.do_update:
            os.makedirs(path)

    def _symlink(self, src, dest):
        logging.info("Creating symlink '%s' -> '%s'", src, dest)

        if self.do_update:
            os.symlink(src, dest)

    def run(self):
        # our config is a simple key value mapping
        for src, dest in self.config.iteritems():
            logging.info("Processing record '%s' -> '%s'", src, dest)

            # figure out where this file is coming from
            real_src = os.path.join(self.location, src)

            # figure out the real dest
            real_dest = os.path.expanduser(dest)
            if os.path.basename(real_dest) == '':
                if os.path.basename(real_src) != '':
                    # link a file to an implied file
                    real_dest = os.path.join(real_dest, os.path.basename(real_src))
                else:
                    # link a directory to an implied directory
                    real_dest = os.path.join(real_dest, os.path.basename(os.path.dirname(real_src)))
            real_dest_parent = os.path.dirname(real_dest)

            logging.info("Record maps file '%s' to '%s'", real_src, real_dest)

            if os.path.islink(real_dest):
                # already symlinked; check if it's to something in our directory
                # if it is, we can update it if we need to; if not, we should ignore it
                link_dest = os.readlink(real_dest)

                if os.path.samefile(link_dest, real_src):
                    logging.info("Link already exists, skipping")
                    continue
                elif not os.path.samefile(self.location, os.path.dirname(link_dest)):
                    logging.info("File '%s' is already symlinked to a location not managed by this script ('%s'), skipping", real_dest, link_dest)
                    continue
            elif os.path.exists(real_dest):
                # need to back up the existing thing, but at least the parent dir is there
                self._backup(real_dest)
            elif not os.path.exists(real_dest_parent):
                # need to create the parent directory
                self._makedirs(real_dest_parent)

            # now make the symlink
            self._symlink(real_src, real_dest)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-u", "--update", help="Perform the update; default False so only a dry-run is performed", action="store_true")
    parser.add_argument("-c", "--config", help="The config file to use, resolved using Python import logic; default '%(default)s'", default="mapping")

    args = parser.parse_args()

    fmt = "- %(message)s"
    if args.update:
        fmt = "* %(message)s"

    logging.basicConfig(level=logging.INFO, format=fmt)

    u = Updater(args.config, args.update)

    u.run()
