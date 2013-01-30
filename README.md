# Collect Links Mode

People often like to collect the URLS in a mail they compose towards
the end of the file. This gets tedious to do manually. Since I could
not find an emacs-mode to do this, I wrote one myself. 

## Features

1. Links are collected at the end
2. Links are uniquified - Links to the same URL get the same number

## TODOs

1. *Incrementally collecting links*: Currently, links can be collected
only once. This is a grave limitation and will be fixed soon

Report a bug/request a feature using the Github issue tracker

## Usage

`
(add-to-list 'load-path "/path/to/collect-links/")
(require 'collect-links)
`
When visiting a file that you want to collect links in, 

`M-x collect-links`

Alternatively, you could call `collect-links-mode` in your mail-mode
hook and use the shortcut `C-c M-l` to collect links

## Example

### Before collect-links

    Hello - This might be a link to http://google.com and
    http://mail.google.com which is further hosted on http://google.com
    Apart from all this, we are also on http://facebook.com For all we
    care, http://facebook.com may also be repeated.

### After collect-links

    Hello - This might be a link to [1] and
    [2] which is further hosted on [1]
    Apart from all this, we are also on [3] For all we
    care, [3] may also be repeated.
    
    [1] http://google.com
    [2] http://mail.google.com
    [3] http://facebook.com

## License

This software is released under the MIT License.
