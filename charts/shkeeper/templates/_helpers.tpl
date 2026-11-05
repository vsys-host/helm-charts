{{- define "shkeeper.waitForDb" -}}
- name: wait-for-db
  image: {{ .Values.waitForDb.image }}
  command: ['sh', '-c', 'until nc -z mariadb 3306; do echo "Waiting for MariaDB..."; sleep 2; done']
{{- end }}

{{- define "shkeeper.createDb" -}}
- name: create-db
  image: {{ .Values.createDb.image }}
  env:
  - name: MYSQL_PWD
    value: {{ .Values.mariadb.rootPassword }}
  command: ['sh', '-c', 'mysql -h mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`{{ .dbName }}\`"']
{{- end }}
