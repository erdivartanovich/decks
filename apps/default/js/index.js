import van from "./van-1.2.8.min.js";
import { getProjects } from "./api.js";

const { a, div, li, p, ul, h1, h2, button } = van.tags;

const Hero = () =>
  div(
    h1("Welcome to DECKS!"),
    p("The Development Environment Containerized Services."),
  );

const ProjectList = async () => {
  const list = van.state([]);
  await getProjects().then((items) => {
    list.val = items.map((item) => ({
      projectName: item.split(":")[0],
      projectSite: item.split(":")[1],
    }));
    console.log(list.val);
  });
  return div(
    p("Your project list:"),
    ul(
      list.val.map((item) =>
        li(
          div(
            {
              class: "item",
            },
            a(
              { href: `http://${item.projectSite}`, target: "_blank" },
              item.projectName,
            ),
            button(
              {
                onclick: () =>
                  window.open(
                    "sh/show-config?site=" +
                      encodeURIComponent(item.projectName),
                    "popUpWindow",
                    "height=400,width=600,left=10,top=10,,scrollbars=yes,menubar=no",
                  ),
              },
              "config",
            ),
          ),
        ),
      ),
    ),
  );
};

export const init = async () => {
  van.add(document.body, Hero());
  van.add(document.body, await ProjectList());
};
