resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "58.3.0"

  create_namespace = true

  set = [
    {
      name  = "grafana.adminPassword"
      value = "gf-hack"
    },
    {
      name  = "grafana.service.type"
      value = "LoadBalancer"
    },
    {
      name  = "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues"
      value = "false"
    }
  ]
}