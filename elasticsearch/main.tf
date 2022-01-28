resource "helm_release" "elasticsearch" {
  name  = (var.helm_name != null ? var.helm_name : "elasticsearch")
  chart = "${path.module}/chart"

  namespace        = var.namespace
  create_namespace = var.create_namespace

  values = [<<-EOT
  agentPool: ${var.agent_pool}
  elasticsearch:
    nodeCount: ${var.node_count}
    storagePerNodeGB: ${var.storage}
  resources:
    limits:
      cpu: ${var.cpu}
      memory: ${var.memory}
  ingress:
    enabled: ${var.ingress}
    annotations:
      kubernetes.io/ingress.class: nginx
      cert-manager.io/cluster-issuer: letsencrypt-issuer-staging
      nginx.ingress.kubernetes.io/rewrite-target: /$1
      nginx.ingress.kubernetes.io/use-regex: "true"
    tls:
      - secretName: https-certificate
        hosts:
          - ${var.domain_name}
    hosts:
      - host: ${var.domain_name}
        paths: ["/(.*)"]
  service:
    port: 9200
  EOT
  ]
}
