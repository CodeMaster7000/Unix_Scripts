#!/bin/bash
Recipient=”Hello@example.com”
Subject=”Greetings”
Message=”Welcome to OnBoard Devs”
`mail -s $Subject $Recipient <<< $Message`
