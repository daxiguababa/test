package main

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func main() {
	r := gin.Default()

	r.StaticFS("/", http.Dir("./html/static/page"))

	if err := r.Run(":8181"); err != nil {
		log.Fatalln("启动服务失败：", err.Error())
	}
}
