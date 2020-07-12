{{ define "body" }}
<article class="center post">

  <div class="col-8 offset-2 ">
    {{ if .Params.feature_image }}
    {{ $image := .Resources.GetMatch ( print .Params.feature_image ) }}
    <img src="{{  $image.Permalink  }}" class="img-fluid" alt="Card image cap">
    {{end}}
    </a>
    <br>
    <a href="{{ .Params.feature_link}}">{{.Params.feature_text}}</a>
    <hr>
    {{ with .Params.categories }} {{ range . }}
    <a class="tag" href='{{ "tags" | absURL }}/{{ . | urlize }}'>#{{ . }}</a>
    {{ end }} {{ end }}
    <hr>
  </div>

  <div class="offset-2 col-8">
    {{.Content}}
    <hr>
    {{ with .Params.tags }} {{ range . }}
    <a class="tag" href='{{ "tags" | absURL }}/{{ . | urlize }}'>#{{ . }}</a>
    {{ end }} {{ end }}
    <hr>
    {{ template "_internal/disqus.html" . }}
  </div>
</article>
{{- partial "footer.html" . -}}

{{ end }}
