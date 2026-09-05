# Designing APIs for humans: Object IDs

Source: <https://dev.to/stripe/designing-apis-for-humans-object-ids-3o5a?utm_source=tldrnewsletter>
## Choosing your ID type

- The most simplistic approach you might take to IDs when using a relational database is to use the row ID, which is an `integer`.

    - *`Order 56` is having problems, can you take a look?”*
    - *Using integer IDs leaves you wide open to `enumeration attacks`, where it becomes trivially easy for malicious actors to guess IDs that they should not be able to since your IDs are sequential.*

- A much better candidate for IDs is the `Universally Unique Identifier`, or UUID. It’s a 32 digit mix of alphanumeric characters (and therefore stored as a string). `4c4a82ed-a3e1-4c56-aa0a-26962ddd0425`

- Stripe object ID, `pi_3LKQhvGUcADgqoEM3bh6pslE`.

## Make it human readable

- pi: payment_intent
- cus: customer
- pm: payment_method
- ch: charge
- ... 

```php
$pi = $stripe->paymentIntents->create([
  'amount' => 1000,
  'currency' => 'usd',
  'customer' => 'cus_MJA953cFzEuO1z',
  'payment_method' => 'pm_1LaXpKGUcADgqoEMl0Cx0Ygg',
]);
```

## Polymorphic lookups

```php
$pi = $stripe->paymentIntents->create([
  'amount' => 1000,
  'currency' => 'usd',
  // This could be a PaymentMethod, Card or Source ID
  'payment_method' => 'card_1LaRQ7GUcADgqoEMV11wEUxU',
]);
```

```php
$pi = $stripe->paymentIntents->create([
  'amount' => 1000,
  'currency' => 'usd',
  // Without prefixes, we'd have to supply a 'type'
  'payment_method' => [
    'type' => 'card',
    'id' => '1LaRQ7GUcADgqoEMV11wEUxU'
  ],
]);
```
This would work, `but this complicates our API with no additional gain`. Rather than payment_method being a simple string, it’s now a hash. Plus there’s no additional information here that can’t be combined into a single string. 

Whenever you use an ID, you’ll want to know what type of object it represents, making `combining these two types of information into one source` a much better solution than requiring additional “type” parameters.

## Preventing human error

For example, on the Stripe Discord server we use Discord’s AutoMod feature to automatically `flag and block messages` that contain a Stripe live secret API key, which starts with `sk_live_`. Leaking such a sensitive key could have drastic consequences for your business, so we take steps to avoid this happening in the environments that we control.

```php
if (preg_match("/sk_live/i", $_ENV["STRIPE_SECRET_API_KEY"])) {
  echo "Live key detected! Aborting!";
  return;
}

echo "Proceeding in test mode";
```

## Designing APIs for humans

visit project of: [Friendly Prefixed IDs for your Ruby on Rails models](https://github.com/excid3/prefixed_ids).
