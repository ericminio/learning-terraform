variables {
    who = "You"
}

run "greetings_value" {
    command = plan

    assert { 
        condition = local.greetings == "Hello You"
        error_message = "greetings message should be Hello You"
    }
}