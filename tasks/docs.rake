# Copyright 2015-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not
# use this file except in compliance with the License. A copy of the License is
# located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions
# and limitations under the License.

desc 'Delete the locally generated docs.' if ENV['ALL']
task 'docs:clobber' do
  rm_rf '.yardoc'
  rm_rf 'doc'
  rm_rf 'docs.zip'
end

desc 'Generates docs.zip'
task 'docs:zip' => 'docs' do
  sh('zip -9 -r -q docs.zip doc/')
end

desc 'Generate doc files.'
task 'docs' => 'docs:clobber' do
  env = {}
  env['SOURCE'] = '1'
  env['SITEMAP_BASEURL'] = 'http://docs.aws.amazon.com/awssdkrubyrecord/api/'
  sh(env, 'bundle exec yard')
end
