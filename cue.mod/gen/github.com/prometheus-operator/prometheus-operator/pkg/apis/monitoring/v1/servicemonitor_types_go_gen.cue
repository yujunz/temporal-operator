// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/prometheus-operator/prometheus-operator/pkg/apis/monitoring/v1

package v1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

#ServiceMonitorsKind:   "ServiceMonitor"
#ServiceMonitorName:    "servicemonitors"
#ServiceMonitorKindKey: "servicemonitor"

// ServiceMonitor defines monitoring for a set of services.
#ServiceMonitor: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// Specification of desired Service selection for target discovery by
	// Prometheus.
	spec: #ServiceMonitorSpec @go(Spec)
}

// ServiceMonitorSpec contains specification parameters for a ServiceMonitor.
// +k8s:openapi-gen=true
#ServiceMonitorSpec: {
	// JobLabel selects the label from the associated Kubernetes service which will be used as the `job` label for all metrics.
	//
	// For example:
	// If in `ServiceMonitor.spec.jobLabel: foo` and in `Service.metadata.labels.foo: bar`,
	// then the `job="bar"` label is added to all metrics.
	//
	// If the value of this field is empty or if the label doesn't exist for the given Service, the `job` label of the metrics defaults to the name of the Kubernetes Service.
	jobLabel?: string @go(JobLabel)

	// TargetLabels transfers labels from the Kubernetes `Service` onto the created metrics.
	targetLabels?: [...string] @go(TargetLabels,[]string)

	// PodTargetLabels transfers labels on the Kubernetes `Pod` onto the created metrics.
	podTargetLabels?: [...string] @go(PodTargetLabels,[]string)

	// A list of endpoints allowed as part of this ServiceMonitor.
	endpoints: [...#Endpoint] @go(Endpoints,[]Endpoint)

	// Selector to select Endpoints objects.
	selector: metav1.#LabelSelector @go(Selector)

	// Selector to select which namespaces the Kubernetes Endpoints objects are discovered from.
	namespaceSelector?: #NamespaceSelector @go(NamespaceSelector)

	// SampleLimit defines per-scrape limit on number of scraped samples that will be accepted.
	// +optional
	sampleLimit?: null | uint64 @go(SampleLimit,*uint64)

	// TargetLimit defines a limit on the number of scraped targets that will be accepted.
	// +optional
	targetLimit?: null | uint64 @go(TargetLimit,*uint64)

	// Per-scrape limit on number of labels that will be accepted for a sample.
	// Only valid in Prometheus versions 2.27.0 and newer.
	// +optional
	labelLimit?: null | uint64 @go(LabelLimit,*uint64)

	// Per-scrape limit on length of labels name that will be accepted for a sample.
	// Only valid in Prometheus versions 2.27.0 and newer.
	// +optional
	labelNameLengthLimit?: null | uint64 @go(LabelNameLengthLimit,*uint64)

	// Per-scrape limit on length of labels value that will be accepted for a sample.
	// Only valid in Prometheus versions 2.27.0 and newer.
	// +optional
	labelValueLengthLimit?: null | uint64 @go(LabelValueLengthLimit,*uint64)

	// Attaches node metadata to discovered targets.
	// Requires Prometheus v2.37.0 and above.
	attachMetadata?: null | #AttachMetadata @go(AttachMetadata,*AttachMetadata)
}

// ServiceMonitorList is a list of ServiceMonitors.
// +k8s:openapi-gen=true
#ServiceMonitorList: {
	metav1.#TypeMeta

	// Standard list metadata
	// More info: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#metadata
	metadata?: metav1.#ListMeta @go(ListMeta)

	// List of ServiceMonitors
	items: [...null | #ServiceMonitor] @go(Items,[]*ServiceMonitor)
}
