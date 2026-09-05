# Securing API keys in a React app

Source: <https://webhookdb.com/blog/2023-05-securing-api-keys-react>
## #1: You can "hide" API keys in the frontend

Here's the first problem: nothing you send to the frontend is hidden.

## #2 All environment variables are equal

When a React application is built, it reads environment variables and can write them into the built files. These built files cannot change (this is why it's a "static" application).

<https://github.com/facebook/create-react-app/issues/865>

## # 3: Don't put .env files into version control

- `.env`
- `.env.local`. Add this file in `.gitignore`

## #4: Use a Proxy to hide API keys

Instead of directly accessing the API from the front end, the front end sends a request to the back-end proxy server; the proxy server then retrieves the API key and makes the request to the API.

## #5: Key Management Services are for APIs

Usually the idea is that whatever builds your frontend application (or runs your backend server) **reads from the secrets manager and injects the variables into environment variables**. You can also read the secret store directly from your application, though this is rarely ideal.

- <https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html>
- <https://devcenter.heroku.com/articles/config-vars>
- <https://www.vaultproject.io/>
- <https://docs.netlify.com/configure-builds/environment-variables/>

## #6: All API keys are the same

Some APIs keys, like for Google Maps or parts of Stripe, are designed to be called from frontends.

These API keys can be embedded into your frontend. It's always possible to restrict them to some degree, like being used from specific domains or able to call certain API endpoints.

## #7: Keeping API keys safe is easy. Or hard

It turns out that keeping API keys safe is easy, because you just need to keep two things in mind:

- Non-public API keys should always be hidden.
- Anything on the frontend cannot effectively be hidden.
