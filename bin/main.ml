open Cmdliner
let main file = Printf.printf "%s says: %s\n%!" file Miniflux_opml_backup.v

let file =
  let doc = "OPML-file to validate" in
  Arg.(required & (* FIXME: Make this a file *) opt (some string) None & info ["f"; "file"] ~docv:"FILE" ~doc)

let () = exit (Cmd.eval (
    let info = Cmd.info "miniflux_opml_backup" ~version:"%%VERSION%%" ~exits: [] in
    Cmd.v info Term.(const main $ file)
  ))
