#!/usr/bin/env node
"use strict";

const jsYaml = require("js-yaml");
const fs = require("fs");
const path = require("path");

const input = path.join(__dirname, ".stylelintrc");
const output = path.join(__dirname, "index.json");

fs.writeFileSync(output, JSON.stringify(jsYaml.safeLoad(fs.readFileSync(input, "utf8"))));
