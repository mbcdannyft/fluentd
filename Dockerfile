FROM fluent/fluentd:latest
MAINTAINER mbc-design
USER fluent
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.2.0/bin:$PATH
RUN gem install fluent-plugin-secure-forward
RUN gem install fluent-plugin-rewrite-tag-filter
RUN fluent-gem install fluent-plugin-mongo
#RUN gem install bson_ext

ONBUILD COPY fluent.conf /fluentd/etc/

EXPOSE 24284
CMD fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins
