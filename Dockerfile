FROM fluent/fluentd:latest
MAINTAINER mbc-design
USER fluent
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.2.0/bin:$PATH
RUN gem install fluent-plugin-secure-forward
RUN gem install fluent-plugin-rewrite-tag-filter
RUN gem install fluent-plugin-rewrite-tag-filter
EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
