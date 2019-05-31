load("//:variables.bzl", "DOCKER_REPOSITORY")

def cref(name):
  """Format name to Bazel reference."""
  return ":{}".format(name)

def cimagename(name):
  """Format image name."""
  return "{}-image".format(name)

def cpushname(name):
  """Format push name."""
  return "{}-push".format(name)

def creponame(image_name):
  """Format repository name."""
  return "{}/{}".format(DOCKER_REPOSITORY, image_name)