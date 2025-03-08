(lang dune 3.17)

(name miniflux_opml_backup)

(generate_opam_files true)

(source
 (github simmel/miniflux-opml-backup))

(authors "Simon Lundström <simmel@soy.se>")

(maintainers "Simon Lundström <simmel@soy.se>")

(license ISC)

(documentation https://github.com/simmel/miniflux-opml-backup)

(package
 (name miniflux_opml_backup)
 (synopsis "Miniflux OPML backup and validator")
 (description "A backup and validation tool for Miniflux OPML export")
 (depends
  ocaml
  (cmdliner
   (>= 1.3.0)))
 (tags
  ("miniflux" "rss" "atom" "opml" "backup" "validation")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
