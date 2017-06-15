# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## 0.1.0 - 2017-06-21
### Added
- supervisord wrapper for mina
  - with support for `start`, `stop`, `restart`, `status`, `signal`
  - and extra tasks `signal:or_start` and `restart:or_start`
