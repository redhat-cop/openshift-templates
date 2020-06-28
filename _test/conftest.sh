#!/usr/bin/env bats

load bats-support-clone
load test_helper/bats-support/load
load test_helper/redhatcop-bats-library/load

setup_file() {
  rm -rf /tmp/rhcop
  conftest_pull
}

@test "amq-broker" {
  tmp=$(split_files "amq-broker")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "app-build" {
  tmp=$(split_files "app-build")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "app-deploy" {
  tmp=$(split_files "app-deploy")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "app-example-ruby" {
  tmp=$(split_files "app-example-ruby")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "jenkins" {
  tmp=$(split_files "jenkins")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "jenkins-s2i-build" {
  tmp=$(split_files "jenkins-s2i-build")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "imagestreams" {
  tmp=$(split_files "imagestreams")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "jenkins-pipelines" {
  tmp=$(split_files "jenkins-pipelines")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "jobs" {
  tmp=$(split_files "jobs")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "namespace" {
  tmp=$(split_files "namespace")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "net-namespace" {
  tmp=$(split_files "net-namespace")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "nexus" {
  tmp=$(split_files "nexus")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "ocp-identity-providers" {
  tmp=$(split_files "ocp-identity-providers")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "operatorhub" {
  tmp=$(split_files "operatorhub")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "pact-broker" {
  tmp=$(split_files "pact-broker")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "prometheus" {
  tmp=$(split_files "prometheus")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "project-requests" {
  tmp=$(split_files "project-requests")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "rhpam" {
  tmp=$(split_files "rhpam")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "rhsso" {
  tmp=$(split_files "rhsso")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "role-bindings" {
  tmp=$(split_files "role-bindings")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "s2i-app-build" {
  tmp=$(split_files "s2i-app-build")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  if [ "$status" -ne 0 ]; then echo "$output"; fi
  [ "$status" -eq 0 ]
}

@test "scc" {
  tmp=$(split_files "scc")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "secrets" {
  tmp=$(split_files "secrets")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "service-accounts" {
  tmp=$(split_files "service-accounts")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "sonarqube" {
  tmp=$(split_files "sonarqube")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}

@test "storage" {
  tmp=$(split_files "storage")

  namespaces=$(get_rego_namespaces "ocp\.deprecated\.*")
  cmd="conftest test ${tmp} --output tap ${namespaces}"
  run ${cmd}

  print_info "${status}" "${output}" "${cmd}" "${tmp}"
  [ "$status" -eq 0 ]
}