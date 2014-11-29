root = exports ? this

if (Meteor.isClient)
  $(document).ready ->
    controller = new root.GameController()
    controller.initialize()