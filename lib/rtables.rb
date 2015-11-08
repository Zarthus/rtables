dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require 'rtables/tablebuilder'

require 'rtables/tables/plaintable'
require 'rtables/tables/simpletable'
require 'rtables/tables/monotable'
require 'rtables/tables/unicodemonotable'
