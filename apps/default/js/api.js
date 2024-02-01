export function getProjects() {
  return fetch("http://localhost/sh", {
    headers: {
      accept: "text/plain",
    },
    method: "GET",
  })
    .then((response) => response.text())
    .then((response) => response.split("\n").slice(0, -1));
}
