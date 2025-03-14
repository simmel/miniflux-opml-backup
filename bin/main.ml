open Cmdliner

let main auth_token url =
  let purl = match url with
    | Some v -> Uri.to_string v
    | None -> "" in
  Printf.printf "Using %s to access %s says: %s\n%!" auth_token purl Miniflux_opml_backup.v

let auth_token =
  let doc = "API key/token to Miniflux" in
  let env =
    Cmd.Env.info "AUTH_TOKEN" ~doc
  in
  Arg.(required & opt (some string) None & info ["auth-token"] ~env ~docv:"API-key" ~doc)

let parse_uri s =
  match Uri.of_string s with
  | uri -> Ok uri
let some_uri s =
  match Uri.of_string s with
  | uri -> Some uri

let uri = Arg.conv (parse_uri, Uri.pp_hum)

let url =
  let doc = "URL to Miniflux" in
  Arg.(value & opt (some uri) (some_uri "https://reader.miniflux.app/v1/")  & info ["url"] ~docv:"URL" ~doc)

let () = exit (Cmd.eval (
    let info = Cmd.info "miniflux_opml_backup" ~version:"%%VERSION%%" ~exits: [] in
    Cmd.v info Term.(const main $ auth_token $ url)
  ))
