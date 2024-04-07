resource "aws_apigatewayv2_api" "CleanerAPI" {
  name          = var.api_gw_name
  protocol_type = "HTTP"

  cors_configuration {
    allow_methods = [ "GET", "POST", "PUT", "DELETE", "PATCH" ]
    allow_origins = ["*"]
    allow_headers = ["*"]
  }

    tags = {
      Name = var.api_gw_name
      Environment = var.environment
      ManagedBy = "terraform"
  }
}

#/tedhelper routes
resource "aws_apigatewayv2_integration" "create_break_time_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_create_break_time_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "create_break_time_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /tedHelper/create-break-time"
  target = "integrations/${aws_apigatewayv2_integration.create_break_time_post_integration.id}"

}

resource "aws_apigatewayv2_integration" "create_travel_time_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_create_travel_time_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "create_travel_time_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /tedHelper/create-travel-time"
  target = "integrations/${aws_apigatewayv2_integration.create_travel_time_post_integration.id}"
}

resource "aws_apigatewayv2_integration" "create_work_time_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_create_work_time_post
  integration_method = "POST"
}


resource "aws_apigatewayv2_route" "create_work_time_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /tedHelper/create-work-time"
  target = "integrations/${aws_apigatewayv2_integration.create_work_time_post_integration.id}"
 
}

#/api/projects routes
resource "aws_apigatewayv2_integration" "api_projects_get_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_projects_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_projects_get_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/projects"
  target = "integrations/${aws_apigatewayv2_integration.api_projects_get_integration.id}"
}

resource "aws_apigatewayv2_integration" "api_projects_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_projects_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_projects_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/projects"
  target = "integrations/${aws_apigatewayv2_integration.api_projects_post_integration.id}"
  
}

#/api/projects/update
resource "aws_apigatewayv2_integration" "api_projects_update_put_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_projects_update_put
  integration_method = "PUT"
}

resource "aws_apigatewayv2_route" "api_projects_update_put_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "PUT /api/projects/update/{id}"
  target = "integrations/${aws_apigatewayv2_integration.api_projects_update_put_integration.id}"

}

#/api/projects/id
resource "aws_apigatewayv2_integration" "api_projects_get_id_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_projects_id_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_projects_get_id_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/projects/{id}"
  target = "integrations/${aws_apigatewayv2_integration.api_projects_get_id_integration.id}"
  
}

#/api/v1/users/login
resource "aws_apigatewayv2_integration" "api_v1_users_login_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_users_login_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_v1_users_login_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/v1/users/login"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_users_login_post_integration.id}"

  
}

#/api/v1/users/register
resource "aws_apigatewayv2_integration" "api_v1_users_register_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_users_register_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_v1_users_register_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/v1/users/register"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_users_register_post_integration.id}"

  
}

#/api/v1/schedule
resource "aws_apigatewayv2_integration" "api_v1_schedule_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_schedule_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_v1_schedule_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/v1/schedule"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_schedule_post_integration.id}"
  
}

resource "aws_apigatewayv2_integration" "api_v1_schedule_get_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_schedule_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_v1_schedule_get_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/v1/schedule"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_schedule_get_integration.id}"
}

resource "aws_apigatewayv2_integration" "api_v1_schedule_id_delete_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_schedule_id_delete
  integration_method = "DELETE"
}

resource "aws_apigatewayv2_route" "api_v1_schedule_id_delete_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "DELETE /api/v1/schedule/{scheduleID}"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_schedule_id_delete_integration.id}"

  
}

resource "aws_apigatewayv2_integration" "api_v1_schedule_patch_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_schedule_patch
  integration_method = "PATCH"
}

resource "aws_apigatewayv2_route" "api_v1_schedule_patch_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "PATCH /api/v1/schedule/{scheduleID}"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_schedule_patch_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_schedules_delete_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_schedules_delete
  integration_method = "DELETE"
}

resource "aws_apigatewayv2_route" "api_v1_schedules_delete_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "DELETE /api/v1/schedule"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_schedules_delete_integration.id}"

}


#/api/v1/user
resource "aws_apigatewayv2_integration" "api_v1_user_get_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_user_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_v1_user_get_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/v1/user"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_user_get_integration.id}"

}

#/api/timesheets
resource "aws_apigatewayv2_integration" "api_timesheets_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_timesheets_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_timesheets_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/timesheets"
  target = "integrations/${aws_apigatewayv2_integration.api_timesheets_post_integration.id}"

}

#/api/activity
resource "aws_apigatewayv2_integration" "api_activity_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_activity_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_activity_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/activity"
  target = "integrations/${aws_apigatewayv2_integration.api_activity_post_integration.id}"

  
}

#/api/user
resource "aws_apigatewayv2_integration" "api_user_create_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_user_create_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_user_create_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/user/create"
  target = "integrations/${aws_apigatewayv2_integration.api_user_create_post_integration.id}"

  
}

resource "aws_apigatewayv2_integration" "api_user_id_get_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_user_id_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_user_id_get_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/user/{uuId}"
  target = "integrations/${aws_apigatewayv2_integration.api_user_id_get_integration.id}"

}

#/api/v1/vehicleLocation
resource "aws_apigatewayv2_integration" "api_v1_vehicle_location_get_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_vehicle_location_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_v1_vehicle_location_get_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/v1/vehicleLocation"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_vehicle_location_get_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_vehicle_location_get_id_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_vehicle_location_get_id
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_v1_vehicle_location_get_id_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/v1/vehicleLocation/{vehicleLocationID}"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_vehicle_location_get_id_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_vehicle_location_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_vehicle_location_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_v1_vehicle_location_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/v1/vehicleLocation"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_vehicle_location_post_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_vehicle_location_patch_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_vehicle_location_patch
  integration_method = "PATCH"
}

resource "aws_apigatewayv2_route" "api_v1_vehicle_location_patch_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "PATCH /api/v1/vehicleLocation/{vehicleLocationID}"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_vehicle_location_patch_integration.id}"

}


#/api/v1/projects
resource "aws_apigatewayv2_integration" "api_v1_projects_get_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_projects_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_v1_projects_get_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/v1/projects"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_projects_get_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_projects_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_projects_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_v1_projects_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/v1/projects"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_projects_post_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_projects_patch_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_projects_patch
  integration_method = "PATCH"
}

resource "aws_apigatewayv2_route" "api_v1_projects_patch_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "PATCH /api/v1/projects/{projectID}"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_projects_patch_integration.id}"

}

#/api/v1/tags
resource "aws_apigatewayv2_integration" "api_v1_tags_get_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_tags_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_v1_tags_get_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/v1/tags"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_tags_get_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_tags_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_tags_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_v1_tags_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/v1/tags"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_tags_post_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_tags_patch_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_tags_patch
  integration_method = "PATCH"
}

resource "aws_apigatewayv2_route" "api_v1_tags_patch_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "PATCH /api/v1/tags/{tagID}"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_tags_patch_integration.id}"

}

#/api/v1/activity
resource "aws_apigatewayv2_integration" "api_v1_activity_get_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_activity_get
  integration_method = "GET"
}

resource "aws_apigatewayv2_route" "api_v1_activity_get_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "GET /api/v1/activity"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_activity_get_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_activity_post_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_activity_post
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "api_v1_activity_post_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "POST /api/v1/activity"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_activity_post_integration.id}"

}

resource "aws_apigatewayv2_integration" "api_v1_activity_patch_integration" {
  api_id             = aws_apigatewayv2_api.CleanerAPI.id
  integration_type   = "HTTP_PROXY"
  connection_type    = "INTERNET"
  integration_uri    = var.dev_alb_dns_name_for_api_v1_activity_patch
  integration_method = "PATCH"
}

resource "aws_apigatewayv2_route" "api_v1_activity_patch_route" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  route_key = "PATCH /api/v1/activity/{activityID}"
  target = "integrations/${aws_apigatewayv2_integration.api_v1_activity_patch_integration.id}"

}



#create default stage
resource "aws_apigatewayv2_stage" "api_gw_default_stage" {
  api_id = aws_apigatewayv2_api.CleanerAPI.id
  name = "$default"
  auto_deploy = true

  default_route_settings {
    throttling_burst_limit = 200
    throttling_rate_limit = 1000
  }


  route_settings {
    route_key = aws_apigatewayv2_route.create_break_time_post_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.create_travel_time_post_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.create_work_time_post_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_projects_get_route.route_key
    detailed_metrics_enabled = false
  
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_projects_post_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_projects_update_put_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_users_login_post_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_users_register_post_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_schedule_post_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_schedule_get_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_schedule_id_delete_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_schedules_delete_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_schedule_patch_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_user_get_route.route_key
    detailed_metrics_enabled = false
    
  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_timesheets_post_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_activity_post_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_user_create_post_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_user_id_get_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_vehicle_location_get_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_vehicle_location_get_id_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_vehicle_location_post_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_vehicle_location_patch_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_projects_get_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_projects_post_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_projects_patch_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_tags_get_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_tags_post_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_tags_patch_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_activity_get_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_activity_post_route.route_key
    detailed_metrics_enabled = false

  }

  route_settings {
    route_key = aws_apigatewayv2_route.api_v1_activity_patch_route.route_key
    detailed_metrics_enabled = false

  } 
  
}