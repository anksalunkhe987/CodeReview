%dw 2.0
import substringAfterLast from dw::core::Strings

output application/json
---
{
  "responseCode": 200,
  "message": "OK",
  "orders": payload.results map (item, index) -> (substringAfterLast((item.path),"/"))
}