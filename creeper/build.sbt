ThisBuild / scalaVersion := "2.12.6"
ThisBuild / organization := "com.creeper"

javacOptions ++= Seq("-source", "1.8", "-target", "1.8", "-Xlint")

scalacOptions ++= Seq(
  "-deprecation",
  "-encoding", "UTF-8",
  "-feature",
  "-language:existentials",
  "-language:higherKinds",
  "-language:implicitConversions",
  "-unchecked",
  "-Xfatal-warnings",
  "-Xlint",
  "-Yno-adapted-args",
  "-Ywarn-dead-code",
  "-Ywarn-numeric-widen",
  "-Ywarn-value-discard",
  "-Xfuture"
)

lazy val creeper = (project in file("."))
  .settings(
    name := "creeper",
    version := "1.0",
    retrieveManaged := true,
    libraryDependencies ++= Seq(
      "org.scalatest" %% "scalatest" % "3.0.5" % Test,
      "com.amazonaws" % "aws-lambda-java-core" % "1.2.0",
      "com.amazonaws" % "aws-lambda-java-events" % "2.2.2",
    ),
    assemblyJarName in assembly := "creeper.jar"
  )