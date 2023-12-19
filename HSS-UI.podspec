Pod::Spec.new do |s|
  s.name             = 'HSS-UI'
  s.version          = '0.1.0'
  s.summary          = 'HSS-UI this is a UI lib. It provide the definitions, components and tolls to build consistent experience.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Josue/HSS-UI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Josue' => 'jghg.02@gmail.com' }
  s.source           = { :git => 'https://github.com/Josue/HSS-UI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.dependency 'PureLayout'

  s.source_files = 'HSS-UI/Classes/Core/**/*.{swift}'
  s.resource_bundles = {
  'HSS-UIResources' => ['HSS-UI/Classes/Resources/**/*.{xib}']
}

end
