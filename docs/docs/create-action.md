# Local actions

You can create your own actions to extend the functionality of pantograph for your project. The action you create will behave exactly like the built in actions.

Just run `pantograph new_action`, enter the name of the action and edit the generated Ruby file in `pantograph/actions/[action_name].rb`. After you finished writing your action, add it to your version control, so it is available for your whole team.

From then on, you can just use your action in your `Pantfile`, just like any other action.

## Submitting the action to the pantograph main repo

Please be aware we may not accept all actions submitted to be bundled with _pantograph_. Before you submit a pull request adding the action to the _pantograph_ code base, submit an issue proposing the new action and why it should be built-in.

In general we tend to accept actions that

- Generally usable for a big majority of developers (e.g. basic interactions with git)
- Solve pain points for application developers
- have an easy to read documentation and great test coverage

In general, we might not accept actions that

- Solve specific use-cases for only a small subset of developers
- Access the API of a third party service, the third party service should own and maintain the action
- Complex actions, that will require a lot of work to maintain in the future
