#!/bin/bash
function createNS() {
suitecloud project:create -i
cd $1
suitecloud account:setup
suitecloud file:import -i
suitecloud object:import -i
suitecloud project:adddependencies
suitecloud project:validate
}

# suitecloud aliases
alias sc='suitecloud'
alias scd='sc project:deploy'
alias scv='sc project:validate --server'
alias nsswitch='sc account:setup'