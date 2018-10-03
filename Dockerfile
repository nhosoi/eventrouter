FROM rhel7:7-released

ENV container=oci

LABEL maintainer="OpenShift Development <dev@lists.openshift.redhat.com>" \
      com.redhat.component="openshift-eventrouter-container" \
      name="openshift3/eventrouter" \
      version="v3.11.0" \
      architecture=x86_64

RUN yum-config-manager --enable rhel-7-server-ose-3.11-rpms && \
    yum install -y openshift-eventrouter && \
    yum clean all

USER nobody

CMD ["/bin/sh", "-c", "/usr/bin/eventrouter -v 3 -logtostderr"]
