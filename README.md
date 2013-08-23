# hipchat\_notify

A simple plugin to send HTTP messages (via POST) to HipChat

# Installation:

Add to bundler.d/hipchat_notify.rb as:

    gem 'foreman_hipchat_notify', :git => 'https://github.com/dieterdemeyer/foreman_hipchat_notify.git'

then update & restart Foreman:

    bundle update

# Usage:


Add to your Foreman `config/settings.yaml`:

```yaml
:hipchat:
  :api_token: '<api token>'
  :room: '<project room>'
  :from: 'Foreman'
  :color: 'purple'
  :notify: '1'
```

# Copyright

Copyright (c) 2012-2013 Dieter De Meyer

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
