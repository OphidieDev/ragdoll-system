local Signal = require(script.Parent.Parent.Signal)

export type RagdollInternals = {
	_constraintsFolder: Folder,
	_noCollisionConstraintFolder: Folder,
	_socketFolder: Folder,
	_sockets: { BallSocketConstraint },
	_noCollisionConstraints: { NoCollisionConstraint },
	_limbs: { BasePart },
	_accessoryHandles: { BasePart },
	_motor6Ds: { Motor6D },
}

export type Ragdoll = {
	Character: Model,
	Humanoid: Humanoid,
	HumanoidRootPart: BasePart,
	RagdollBegan: Signal.Signal<()>,
	RagdollEnded: Signal.Signal<()>,
	Collapsed: Signal.Signal<()>,
	Destroying: Signal.Signal<()>,
	isRagdolled: (self: Ragdoll) -> boolean,
	isCollapsed: (self: Ragdoll) -> boolean,
	isFrozen: (self: Ragdoll) -> boolean,
	activateRagdollPhysics: (self: Ragdoll) -> (),
	activateRagdollPhysicsLowDetail: (self: Ragdoll) -> (),
	deactivateRagdollPhysics: (self: Ragdoll) -> (),
	collapse: (self: Ragdoll) -> (),
	collapseLowDetail: (self: Ragdoll) -> (),
	freeze: (self: Ragdoll) -> (),
	unfreeze: (self: Ragdoll) -> (),
	destroy: (self: Ragdoll) -> (),
	Destroy: (self: Ragdoll) -> (),
}

export type Blueprint = {
	numLimbs: number?,
	socketSettings: {
		[string]: {
			MaxFrictionTorque: number,
			UpperAngle: number,
			TwistLowerAngle: number,
			TwistUpperAngle: number,
		},
	},
	cframeOverrides: { [string]: { C0: CFrame, C1: CFrame } }?,
	lowDetailModeLimbs: { [string]: boolean }?,
	satisfiesRequirements: (Model) -> boolean,
	finalTouches: (RagdollInternals & Ragdoll) -> (),
}

local Types = {}

return Types
