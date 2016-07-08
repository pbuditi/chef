name "dev"
description "this is dev environment"
cookbook "apache","0.1.0"
override_attributes({
	"auther" => {
		"name" => "I am author"
	}
})
