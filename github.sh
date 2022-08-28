#!/bin/bash

# exec local machine
gh api graphql -f query='
query{
  node(id: "") {
    ... on ProjectV2 {
      items(first: 20) {
        nodes{
          fieldValues(first: 10) {
            nodes {
              ... on ProjectV2ItemFieldLabelValue {
                labels(first: 10) {
                  nodes {
                    issues(last: 10,labels: "onboard") {
                      nodes {
                        title
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
'
