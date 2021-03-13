# AWS-SDK for Common Lisp

## Warning

This is a fork of [aws-sdk-lisp](https://github.com/pokepay/aws-sdk-lisp).  I
have pulled in the latest aws-sdk specs as of 3.12.2021 and made some other
updates. I've changed the build process a bit and I don't want to force those
changes on anyone, so I am going to rename this fork and see where it goes.

It is currently broken.  None of the v4 signing is working.  Once I have that
fixed I am likely going to make more changes, so consider this Alpha.

## Usage

AWS-SDK provides interfaces for each AWS services as individual systems under
"aws-sdk-cl/services/*".

__Here's an example to send an SMS via Amazon Simple Notification Service:__

```lisp
(asdf:load-system :aws-sdk-cl)
(asdf:load-system :aws-sdk-cl/services/sns)

(setf aws:*session* (aws:make-session))

(aws/sns:publish :phone-number "+8190xxxxxxxx" :message "Hi, there")
```

__Here's an example of listing your s3 buckets:__

```lisp
(asdf:load-system :aws-sdk-cl)
(asdf:load-system :aws-sdk-cl/services/s3)

(setf aws:*session* (aws:make-session))

(aws/s3:list-buckets)
```

## Configuring the SDK

### Configuring Credentials

Before using the SDK, you'll need to set AWS credentials for AWS services.
AWS-SDK supports multiple methods to configure AWS credentials.

* Environment Credentials: Set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
  environment variables
* Shared Credentials file (~/.aws/credentials).
* EC2 Instance Role Credentials

It's also can be configured via `aws:*session*`:

```lisp
(setf aws:*session*
      (aws:make-session :credentials
                        (aws:make-credentials
                         :access-key-id "XXXXXXXXXXXXXXXXXXXX"
                         :secret-access-key "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                         :session-token "xxxxxxxxxxx")))
```

### Configuring AWS Region

For making AWS API request, AWS region is also required. There're multiple
methods to configure it.

* Environment variable: `AWS_REGION`
* Shared configuration file (~/.aws/config).

It's also can be configured via `aws:*session*`:

```common-lisp
(setf aws:*session* (aws:make-session :region "us-west-2"))
```

## Development note

### Generating all services

I am using [CLPM](https://clpm.dev) as my package manager.  Read up on it if
you're interested. If you are not using CLPM, check out the clpmfile.lock to see
what systems you will need to have available.  If you are using it, do the
following in the terminal:

```sh
clpm bundle install
clpm bundle exec -- sbcl \
  --eval '(asdf:load-system :aws-sdk-cl/generator)' \
  --eval '(uiop:symbol-call :aws-sdk-cl/generator :generate-all-services)' \
  --quit
```

## Authors

* Eitaro Fukamachi (e.arrows@gmail.com)
* Jason Legler (j@legler.io)

Fukamachisan is the original author of this library under the generous support
of [Pocket Change, K.K.](https://www.pocket-change.jp/).

This fork of [aws-sdk-lisp](https://github.com/pokepay/aws-sdk-lisp) is
maintained by Jason Legler.

## Copyright

Copyright (c) 2017 Eitaro Fukamachi (e.arrows@gmail.com)

## License

Licensed under the BSD 2-Clause License.
