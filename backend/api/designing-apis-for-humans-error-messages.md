# Designing APIs for humans: Error messages

Source: <https://dev.to/stripe/designing-apis-for-humans-error-messages-94p>

Paul Asjes
## Good error message, bad error message

Good example: [visit](https://stripe.com/docs/api/errors)

```bash
# Bad example
{
  status: 200,
  body: {
    message: "Error"
  }
}
```

## Send the right code

The above is an error, or is it? The body message says it is, however the status code is 200, which would indicate that **everything’s fine**. This is not only confusing, but outright dangerous.

**Code	Message**\
200 - 299	All good\
400 - 499	You messed up\
500 - 599	We messed up

```javascript
// ❌ Don't forget the error status code
app.post('/your-api-route', async (req, res) => {      
  try {
    // ... your server logic
  } catch (error) {    
    return res.send({ error: { message: error.message } });
  }  

  return res.send('ok');
});

// ✅ Do set the status correctly
app.post('/your-api-route', async (req, res) => {      
  try {
    // ... your server logic
  } catch (error) {    
    return res.status(400).send({ error: { message: error.message } });
  }  

  return res.send('ok');
});
```

In the top snippet we send a 200 status code, regardless of whether an error occurred or not. In the bottom we fix this by simply **making sure that we send the appropriate status** along with the error message.

## Be descriptive

```bash
# better
{
  status: 404,
  body: {
    error: {
      message: "Customer not found"
    }    
  }
} 
```

## Be helpful

This is where I think great APIs distinguish themselves from simply “okay” APIs.

For starters, let’s be explicit about which customer was not found:
```bash
# more better
{
  status: 404,
  body: {
    error: {
      message: "Customer cus_Jop8JpEFz1lsCL not found"
    }    
  }
}

# more better
{
  status: 404,
  body: {
    error: {
      message: "Customer cus_Jop8JpEFz1lsCL not found; a similar object exists in live mode, but a test mode key was used to make this request."
    }    
  }
}
```
:warning: Note: Be careful with what information you provide in situations like that last bullet point, as it’s possible to leak information that could be a security risk.

## Be empathetic

The most frustrating error is the 500 error. It means that something went wrong on the API side and therefore wasn’t the developer’s fault. These types of errors could be a momentary glitch or a potential outage on the API provider’s end, which you have no real way of knowing at the time. If the end user relies on your API for a business critical path, then getting these types of errors are very worrying, particularly if you start to get them in rapid succession.

Some examples: 
- “An error occurred, the team has been informed. If this keeps happening please contact us at {URL}”
- “Something went wrong, please check our status page at {URL} if this keeps happening”
- “Something goofed, our engineers have been informed. Please try again in a few moments”

## Putting it all together

```javascript
{
  status: 404,
  body: {
    error: {
      code: "resource_missing",
      doc_url: "https://stripe.com/docs/error-codes/resource-missing",
      message: "No such customer: 'cus_Jop8JpEFz1lsCL'; a similar object exists in live mode, but a test mode key was used to make this request.",
      param: "id",
      type: "invalid_request_error"
    }
  },
  headers: {    
    'request-id': 'req_su1OkwzKIeEoCy',
    'stripe-version': '2020-08-27',    
  }  
}
```

Here we are:
1. Using the correct HTTP status code
2. Wrapping the error in an “error” object
3. Being helpful by providing:
    - The error code
    - The error type
    - A link to the relevant docs
    - The API version used in this request
    - A suggestion on how to fix the issue
4. Providing the request ID to look up the request and response pairing
