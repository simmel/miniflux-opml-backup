open Cmdliner
let main auth_token url = Printf.printf "Using %s to access %s says: %s\n%!" auth_token url Miniflux_opml_backup.v

let auth_token =
  let doc = "API key/token to Miniflux" in
  let env =
    Cmd.Env.info "AUTH_TOKEN" ~doc
  in
  Arg.(required & opt (some string) None & info ["auth-token"] ~env ~docv:"API-key" ~doc)

let url =
  let doc = "URL to Miniflux" in
  Arg.(value & opt (* FIXME Make this an Uri type *) string "https://reader.miniflux.app/v1/" & info ["url"] ~docv:"URL" ~doc)

let () = exit (Cmd.eval (
    let info = Cmd.info "miniflux_opml_backup" ~version:"%%VERSION%%" ~exits: [] in
    Cmd.v info Term.(const main $ auth_token $ url)
  ))
