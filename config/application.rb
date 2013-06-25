# Frameworks/Gems
require 'rubygems'
require 'bundler'
require 'goliath'
require 'goliath/rack/templates'
require 'goliath/plugins/latency'
require 'ohm'
require "ohm/json"
require 'ohm/contrib'
require 'grape'
require 'securerandom'
require 'celluloid'
require 'tilt'
require 'bluecloth'
require 'haml'
require 'debugger'

# Application Configuration
require "config"

# Common Modules
require "lib/uuid"
require "lib/date_time"

# Endpoints
require 'lib/api/endpoints/devices'
require 'lib/api/endpoints/physical_entities'
require 'lib/api/endpoints/virtual_entities'
require 'lib/api/endpoints/data'

# Models
require 'lib/models/device'
require 'lib/models/physical_entity'
require 'lib/models/virtual_entity'
require 'lib/models/meta_data'
require 'lib/models/datum'

# Application
require 'lib/api/application'

# Framework Setup
import 'template'
import 'websocket'

# Connect the ORM to the Redis server
Ohm.connect

# Register a markdown handler
Tilt.register 'markdown', Tilt::BlueClothTemplate