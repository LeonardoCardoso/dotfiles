# Increase the number of Xcode parallel subtasks
defaults write com.apple.Xcode PBXNumberOfParallelBuildSubtasks 8

# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock