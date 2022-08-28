#!/bin/bash

# exec local machine
gh api graphql -f query='
query{
  node(id: "") {
    ... on ProjectV2 {
      items(first: 50) {
        nodes {
          fieldValues(first: 8) {
            nodes{
              ... on ProjectV2ItemFieldNumberValue {
                number
                field {
                  ... on ProjectV2FieldCommon {
                    name
                  }
                }
              }
            }
          }
          content {
            ... on Issue {
              title
              labels(first: 10) {
                nodes {
                  name
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
# > res.txt

# echo "==Toil task=="
# cat res.txt | jq -r '.data.node.items.nodes[].content | select(.labels.nodes[]?.name == "toil") | [.title]'
# echo "==Toil Resolve task=="
# cat res.txt | jq -r '.data.node.items.nodes[].content | select(.labels.nodes[]?.name == "toil/resolve") | [.title]'
