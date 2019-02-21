<p align="center"><img src="https://avatars3.githubusercontent.com/u/45311177?s=200&v=4"></p>

<p align="center">
<a href="https://travis-ci.org/nuxed/framework"><img src="https://travis-ci.org/nuxed/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/nuxed/framework"><img src="https://poser.pugx.org/nuxed/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/nuxed/framework"><img src="https://poser.pugx.org/nuxed/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/nuxed/framework"><img src="https://poser.pugx.org/nuxed/framework/license.svg" alt="License"></a>
<a href="https://gitter.im/Nuxed/framework?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge"><img src="https://badges.gitter.im/Nuxed/framework.svg" alt="License"></a>
</p>

# Nuxed

## Hack framework for building web applications with expressive, elegant syntax

---

### Getting Started

#### Requirements

- HHVM 4+
- Composer Package Manager

#### Installation

install Nuxed by issuing the Composer `create-project` command in your terminal:

```console
$ composer create-project --prefer-dist nuxed/nuxed my-app
```

#### Start

Nuxed skelecton comes with few handy composer scripts.
you can run the application by issuing the Composer `deploy` script in your terminal:

```console
$ cd my-app
$ composer deploy
```

> visit http://localhost:8080

other composer scripts:

- `lint`: lint your code using `hhast`.
- `type-check`: type check your code using the hack type checker.
- `check`: lint and type check your code.
- `build`: dump production autoloader.
- `format`: format your code using `hackfmt`.
- `run`: start the proxygen server.
- `deploy`: dump production autoloader and start the proxygen server.

---

### Security Vulnerabilities

If you discover a security vulnerability within Nuxed, please send an e-mail to Saif Eddin Gmati via azjezz@protonmail.com.

---

### License

The Nuxed framework is open-sourced software licensed under the MIT-licensed.
