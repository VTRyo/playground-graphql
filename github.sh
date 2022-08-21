#!/bin/bash

# exec local machine
gh api graphql -f query=\
'query {
   user(login: "VTRyo") {
    contributionsCollection {
      contributionCalendar {
        totalContributions
      }
    }
  }
}'
