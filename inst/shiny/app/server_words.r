tr <- function(text){ # translates text into current language
 sapply(text,function(s) translation[[s]][[input$language]], USE.NAMES=FALSE)
}

output$ini           <- renderText({ tr("inicio")    })
output$sigla         <- renderText({ tr("gbq")       })
output$titulo        <- renderText({ tr("titulo")    })
output$saudacao      <- renderText({ tr("saudacao")  })
output$criarrem      <- renderText({ tr("criarrem")  })
output$criar         <- renderText({ tr("criar")     })
output$ncountry      <- renderText({ tr("ncountry")  }) 
output$compname      <- renderText({ tr("compname")  })
output$escsigla      <- renderText({ tr("escsigla")  })
output$ndiscp        <- renderText({ tr("ndiscp")    })
output$nassun        <- renderText({ tr("nassun")    })
output$gbanco        <- renderText({ tr("gbanco")    })
output$remover       <- renderText({ tr("remover")   })
output$criardisc     <- renderText({ tr("criardisc") })
output$rebanco       <- renderText({ tr("rebanco")   })
output$gdisc         <- renderText({ tr("gdisc")     })
output$gassu         <- renderText({ tr("gassu")     })
output$gdatbanco     <- renderText({ tr("gdatbanco") })
output$gdatapp       <- renderText({ tr("gdatapp")   })
output$gdatb         <- renderText({ tr("gdatb")     }) 
output$gdatb2        <- renderText({ tr("gdatb")     }) 
output$pquest        <- renderText({ tr("pquest")    })
output$utbanco       <- renderText({ tr("utbanco")   })
output$esbanqu       <- renderText({ tr("esbanqu")   })
output$esbdados      <- renderText({ tr("esbdados")  }) 
output$tquestaoa     <- renderText({ tr("tquestaoa") })
output$tquestaon     <- renderText({ tr("tquestaon") })
output$tquestaom     <- renderText({ tr("tquestaom") })
output$tquestaos     <- renderText({ tr("tquestaos") })
output$tquestaoas    <- renderText({ tr("tquestaoas")})
output$tquestaoas1   <- renderText({ tr("tquestaoas")})
output$tquestaoaa    <- renderText({ tr("tquestaoaa")})
output$tquestaoaa1   <- renderText({ tr("tquestaoaa")})
output$tquestaoaa2   <- renderText({ tr("tquestaoaa")})
output$tquestaoaa3   <- renderText({ tr("tquestaoaa")})
output$tquestaoaa4   <- renderText({ tr("tquestaoaa")})
output$tquestaoaa5   <- renderText({ tr("tquestaoaa")})
output$associacao    <- renderText({ tr("associacao")})
output$mista         <- renderText({ tr("mista")     })
output$templ1        <- renderText({ tr("templ1")    })
output$templ2        <- renderText({ tr("templ2")    })
output$templ3        <- renderText({ tr("templ3")    })
output$templ4        <- renderText({ tr("templ4")    })
output$templ5        <- renderText({ tr("templ5")    })
output$templ6        <- renderText({ tr("templ6")    })
output$templ7        <- renderText({ tr("templ7")    })
output$templ8        <- renderText({ tr("templ8")    })
output$botpdf        <- renderText({ tr("botpdf")    })
output$botxml        <- renderText({ tr("botxml")    })
output$botzip        <- renderText({ tr("botzip")    })
output$tutorial      <- renderText({ tr("tutorial")     })
output$qdissertexto  <- renderText({ tr("qdissertexto") })
output$qdissernum    <- renderText({ tr("qdissernum")   })
output$qunicaesc     <- renderText({ tr("qunicaesc")    })
output$qmultesc      <- renderText({ tr("qmultesc")     })
output$qassocia      <- renderText({ tr("qassocia")     })
output$qmista        <- renderText({ tr("qmista")       })
output$tfigura       <- renderText({ tr("tfigura")      })
output$tfigura1      <- renderText({ tr("tfigura")      })
output$tfigura2      <- renderText({ tr("tfigura")      })
output$tfigura3      <- renderText({ tr("tfigura")      })
output$tfigura4      <- renderText({ tr("tfigura")      })
output$tfigura5      <- renderText({ tr("tfigura")      })
output$trespnum      <- renderText({ tr("trespnum")     })
output$ttol          <- renderText({ tr("ttol")         })
output$talternativa  <- renderText({ tr("talternativa") })
output$talternativa2 <- renderText({ tr("talternativa") })
output$talternativa3 <- renderText({ tr("talternativa") })
output$talternativa4 <- renderText({ tr("talternativa") })
output$tresposta     <- renderText({ tr("tresposta")    })
output$tresposta2    <- renderText({ tr("tresposta")    })
output$tresposta3    <- renderText({ tr("tresposta")    })
output$tresposta4    <- renderText({ tr("tresposta")    })
output$tcondicao     <- renderText({ tr("tcondicao")    })
output$tpathfig      <- renderText({ tr("tpathfig")     })
output$tpathfig1     <- renderText({ tr("tpathfig")     })
output$tpathfig2     <- renderText({ tr("tpathfig")     })
output$tpathfig3     <- renderText({ tr("tpathfig")     })
output$tpathfig4     <- renderText({ tr("tpathfig")     })
output$tpathfig5     <- renderText({ tr("tpathfig")     })
output$bsalvar       <- renderText({ tr("bsalvar")      })
output$bsalvar1      <- renderText({ tr("bsalvar")      })
output$bsalvar2      <- renderText({ tr("bsalvar")      })
output$bsalvar3      <- renderText({ tr("bsalvar")      })
output$bsalvar4      <- renderText({ tr("bsalvar")      })
output$bsalvar5      <- renderText({ tr("bsalvar")      })
output$minterativo   <- renderText({ tr("minterativo")  })
output$mninterativo  <- renderText({ tr("mninterativo") })
output$questexto     <- renderText({ tr("questexto")    })
output$quesnum       <- renderText({ tr("quesnum")      })
output$trespnum      <- renderText({ tr("trespnum")     })
output$quesunica     <- renderText({ tr("quesunica")    })
output$alta          <- renderText({ tr("alta")         })
output$altb          <- renderText({ tr("altb")         })
output$altc          <- renderText({ tr("altc")         })
output$altd          <- renderText({ tr("altd")         })
output$alte          <- renderText({ tr("alte")         })
output$quesmult      <- renderText({ tr("quesmult")     })
output$quesasso      <- renderText({ tr("quesasso")     })
output$quesmista     <- renderText({ tr("quesmista")    })
output$mversaoatu    <- renderText({ tr("mversaoatu")   })
output$bsim          <- renderText({ tr("bsim")         })
output$bnao          <- renderText({ tr("bnao")         })
output$mreiniciar    <- renderText({ tr("mreiniciar")   })
output$mreiniciar2   <- renderText({ tr("mreiniciar")   })

