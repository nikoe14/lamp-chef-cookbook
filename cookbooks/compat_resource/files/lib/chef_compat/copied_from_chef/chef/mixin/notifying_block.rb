begin
  require 'chef/mixin/notifying_block'
rescue LoadError; end

require 'chef_compat/copied_from_chef'
class Chef
module ::ChefCompat
module CopiedFromChef
#--
# Author:: Lamont Granquist <lamont@chef.io>
# Copyright:: Copyright 2010-2016, Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class Chef < (defined?(::Chef) ? ::Chef : Object)
  module Mixin
    CopiedFromChef.extend_chef_module(::Chef::Mixin, self) if defined?(::Chef::Mixin)
    module NotifyingBlock
      CopiedFromChef.extend_chef_module(::Chef::Mixin::NotifyingBlock, self) if defined?(::Chef::Mixin::NotifyingBlock)

      def notifying_block(&block)
        begin
          subcontext = subcontext_block(&block)
          Chef::Runner.new(subcontext).converge
        ensure
          # recipes don't have a new_resource
          if respond_to?(:new_resource)
            if subcontext && subcontext.resource_collection.any?(&:updated?)
              new_resource.updated_by_last_action(true)
            end
          end
        end
      end

      def subcontext_block(parent_context = nil, &block)
        parent_context ||= @run_context
        sub_run_context = parent_context.create_child

        begin
          outer_run_context = @run_context
          @run_context = sub_run_context
          instance_eval(&block)
        ensure
          @run_context = outer_run_context
        end

        sub_run_context
      end

    end
  end
end
end
end
end
