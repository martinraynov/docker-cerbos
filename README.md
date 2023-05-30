# docker-cerbos
Dockerized cerbos authorization application

## Example 

```
curl --location --request POST 'https://cerbos.local.io/api/check' -k \
    --header 'Content-Type: application/json' \
    --data-raw '{
      "principal": {
        "id": "user_1",
        "roles": ["user"],
        "attr": {}
      },
      "resource": {
        "kind": "contact",
        "instances": {
            "contact_1": {
                "attr": {}
            }
        }
      },
      "actions": ["read"]
    }'
```