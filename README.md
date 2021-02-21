# Quick Start

You can have plenty of ways to run `hygen`. Pick one of the following:

On macOS and Homebrew:



`$ brew tap jondot/tap`

`$ brew install hygen`



Globally with npm (or yarn):



`$ npm i -g hygen `

Or, if you like a no-strings-attached approach, use with [`npx`](https://medium.com/@maybekatz/introducing-npx-an-npm-package-runner-55f7d4bd282b)



`$ npx hygen ...`



## Installing a Package[#](http://www.hygen.io/docs/packages#installing-a-package)

First, you need to install the `hygen-add` tool, it's one of the tools in the `hygen` toolbelt.

Copy

`$ yarn global add hygen-add`



## Installing from Github[#](http://www.hygen.io/docs/packages#installing-from-github)

`hygen-add` supports installing from Github, in the same way `yarn` supports it because it uses `yarn` under the hood. It will try to infer the package name from the Github repo URL.

Running this:



`$ hygen-add https://github.com/google-microsoft/hygen-smartcompany`





## Name Clashes[#](http://www.hygen.io/docs/packages#name-clashes)

If you want to install a `react` package from both `acme` and `awesome`, you can prefix one of those, or both, to avoid name clashes:

`$ hygen-add acme-react`

`$ hygen-add awesome-react --prefix awsm`


# hygen-smartcompany

## create CRUD with fuzzy search in saas-framework  
```shell script

hygen  hygen-smartcompany fuzzy --name Test

```

