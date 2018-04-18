class HomeController < ApplicationController
  
  
    def keyboard_init
        msg =
            {
              type: "buttons",
              buttons: ["전자공학부 홈페이지", 
              "종합정보시스템", 
              "소자정보",
              "사용법",   #저항읽는법, 커패시터읽는법,인덕터읽는법,
              "전자상식(추가중)",
              "랜덤정보(바뀜)",  # 빛의속도, 단위 , 
              "충북대학교 어둠의게시판"]
            }
        render json: msg, status: :ok
    end
    
    
    
    
    def chat_control
      
        received_data = JSON.parse(request.raw_post)
        user_key = received_data["user_key"]
        type_name = received_data["type"]
        content = received_data["content"]
        
        puts(user_key, type_name, content)
        
        main_menu = ["전자공학부 홈페이지",
        "종합정보시스템",
        "소자정보",   #코텍스M3추가해야함
        "사용법",
        "전자상식(추가중)",
        "랜덤정보(바뀜)",
        "충북대학교 어둠의게시판"]
                                            
        circuit_menu = ["■처음으로",
                "2114",
                "2716",
                "4001",
                "4011",
                "4050",
                "4520",
                "7400",
                "7402", 
                "7403", 
                "7404",
                "7405",
                "7406",
                "7408",
                "7410",
                "7411",
                "7420",
                "7421",
                "7432",
                "7442",
                "7447",
                "7472",
                "7474",
                "7476",
                "7486",
                "7489",
                "7490",
                "7493",
                "74121",
                "74138",
                "74151",
                "74153",
                "74164",
                "74169",
                "74390",
                "1N4001",#여기부터
                "1N4002",
                "2N2222",
                "CA3046",
                "CD4007",
                "MC14007UB",#여기까지 추가
                "FND507(7segment)",
                "LM555(timer)",
                "LM741",
                "8p Dip Switch",
                "라즈베리파이",
                "아두이노",
                "검색(AllDataSheet)"]
                
        use_menu = ["■처음으로",
                  "저항 읽는법",
                  "커패시터 읽는법",
                  "인덕터 읽는법",
                  "브래드보드 사용법",
                  "가변저항 사용법",
                  "함수발생기 사용법",
                  "오실로스코프 사용법(작성중)",
                  "아날로그 멀티미터(테스터기) 사용법(작성중)",
                  "디지털 멀티미터 사용법(작성중)",
                  "전원공급기 사용법(작성중)",
                  "납땜하는 방법(작성중)",
                  "피스파이스 사용법",
                  "MATLAB 사용법(작성중)"]
                  
        formula_menu = ["■처음으로", 
        "단위",
        "각종상수들",   #"빛의 속도",
        "오일러 공식", 
        "Y-Δ 변환",
        "반도체전류공식?",
        "계속 추가할 예정"
        ]
        
        random_reply = ["표어는 개신(開新, NOVA APERIO), 건학이념은 진리, 정의, 개척.",
        
        "거점국립대 중에서 제주대 다음으로 학생 수가 적다.\
        다른 거점국립대의 학생수가 2만명 초반~3만명 근접인데에 비하여 심하게 적은 학생수이다.\
        기본적으로 충북 인구가 적은데다가 전통적으로 청주는 청주대, 서원대, 교원대 등 규모있는 4년제 대학이 많은 것이 이유로 보인다.",
        
        "1951년 도립 청주초급농과대학으로 개교하여, 1963년 국립 충북대학으로 개편되었다.",
        
        "2012년까지만해도 기숙사에 점호가 있었다. 월~목 밤 12시 통금으로, 이 시간이 되면 층장이 인원점검을 하는 식이었다.\
        그러다 2013년부터 점호를 없애고 통금시간도 새벽 1시로 변경되었다.",
        
        "서울대학교를 제외한 국립대학 총장은 공무원으로서 장관에 준하는 대우를 받는다.",
        
        "2018년 4월 12일 직선제로 치러진 차기 충북대 총장 선거에서 법학전문대학원 김수갑(56) 교수가 임용후보자로 당선됐다.",
        
        "2012년 2학기부터 N14(구 56동)에서 강의하는 교양과목에 전자출결이 도입되었다.\
        강의실 앞에서 학생증을 찍고 교수가 인원수를 확인하는 식이다. 전자출결 도입으로 대리출석이 어려워 질 듯 싶다.\
        출결기가 고장나는 일도 종종 있어서 교수도 학생도 귀찮기만 하다. 현재는 사용되지 않는 듯 하다.",
        
        "기존 학칙에는 재수강 상한선제와 학점포기제도가 없었고 전공과목은 절대평가로 하였으나,\
        2011년에 전공과목을 상대평가로 전환하고 2012학년도 부터 재수강 상한선제와 학점포기제도가 도입되었다.\
        이에 따라 C+이하인 과목부터 재수강이 가능하게 되었으며 재수강시 최고로 받을 수 있는 학점은 B+이다.\
        또한 7학기(4학년 1학기)때 최대 3학점 과목 1개에 한하여 학점포기가 가능였다. 하지만 2014년 9월 1일자로 학점포기제도가 사라졌다.\
        추가적으로 2011년 겨울방학에 전공과목의 신청은 해당 학년 학생들의 수강신청 기간에 우선적으로 받는 규범이 시행되기도 하였다.\
        2017년부터 재수강시 최고로 받을 수 있는 학점이 A0로 상향되었다.",
        
        "국립대 특성상 건물들과 시설들이 노후된 편이다. 타 대학교는 기존 건물도 리모델링이나 증축을 많이 하는 편이나 충북대는 그런거 없다.\
        에어컨이나 빔프로젝터가 없는 강의실이 은근 많으며 이런 시설이 구비되어있어도 기계가 노후된 강의실이 대다수다.\
        이것 외에도 책걸상이 망가져 방치되어있는 강의실도 있고 일반 초, 중, 고교 교실 만도 못한 강의실이 대다수다.\
        동아리에 대한 투자는 전무하다고 봐도 무방한 상황. 학생들이나 교수들 사이에서는 시설개선을 촉구하고 있으나 학교는 예산이 부족하다는 이유로 모르쇠 일관하고 있다.\
        그런데도 불구하고 영재교육용 강의실 등 외부에만 알려져 있지 학생과는 아무 상관 없는 용도로 쓰이는 시설은 차등적으로 먼저 리모델링 하는 모습을 보여줘서 까인다.",
        
        "2016년에 비사범대 학사과정을 대상으로 하는 교직과정이 D등급 평가를 받아, 선발인원을 50% 감축하게 되었다."
        ].sample
        
        
        if content == "전자공학부 홈페이지"
            msg = {
              message: {
                     "message_button": {
                      "label": "전자공학부",
                      "url": "http://elec.chungbuk.ac.kr/index.php"
                    }
              },
               
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
            
            
            
            
        elsif content == "종합정보시스템"
            msg = {
              message: {
                     "message_button": {
                      "label": "종합정보시스템",
                      "url": "http://gaesin.chungbuk.ac.kr/login.html"
                    }
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
            
            
        elsif content == "소자정보"
            msg = {
              message: {
                text: "소자를 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons:  circuit_menu
              }
            }
            render json: msg, status: :ok            
            
            
            
            
            
                                    elsif content == "■처음으로"           #공통적으로 쓰는 ■처음으로
                                        msg = {
                                          message: {
                                            text: "원하는 항목을 선택해주세요."
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: main_menu
                                          }
                                        }
                                        render json: msg, status: :ok             
            
            
                                    elsif content == "2114"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99A596505AD378590FC836",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/43?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                   
            
            
                                    elsif content == "2716"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile22.uf.tistory.com/image/99E9EE455AD378A5091C1F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/44?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                        
                                    elsif content == "4001"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/9959704E5AD378E20996BA",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/45?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4011"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/9970594B5AD37932285D3A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/46?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4050"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99D55B445AD3795727766C",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/47?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4520"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/9957384D5AD379990A25DB",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/48?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "7400"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/997C684C5AD35E810E9408",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/11?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           

                                    elsif content == "7402"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/9945034A5AD35F6F1A12CB",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/12?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7403"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile6.uf.tistory.com/image/997FD54A5AD36FEE38883F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/13?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7404"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile30.uf.tistory.com/image/9925A74D5AD37036109DB8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/14?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7405"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/99D9B3495AD3706C32151C",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/15?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7406"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/9959663F5AD370910AD8F4",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/16?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7408"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile24.uf.tistory.com/image/9920B93C5AD370BC1B9B8B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/17?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7410"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile3.uf.tistory.com/image/99D20A335AD3710606EB75",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/18?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7411"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/997493335AD371320D83D8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/19?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7420"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile8.uf.tistory.com/image/9979A93D5AD371630C1294",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/20?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7421"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/99A82B3C5AD3719029FE69",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/21?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7432"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile8.uf.tistory.com/image/99038A395AD371BA275CA0",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/22?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7442"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/9982A2355AD371EA0B8868",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/23?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7447"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile4.uf.tistory.com/image/995BB63A5AD37216366455",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/24?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7472"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99453B375AD37253200912",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/25?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7474"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/993AE3405AD372A10C3B63",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/26?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7476"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99E0A7335AD372CF1D5418",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/27?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 


                                    elsif content == "7486"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile22.uf.tistory.com/image/992F52395AD372F302F1FF",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/28?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 


                                    elsif content == "7489"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile7.uf.tistory.com/image/9929C43E5AD3731B34E87E",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/29?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "7490"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/997284335AD37344035160",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/30?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "7493"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99BBF33B5AD3736A128D87",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/31?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74121"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/9957673A5AD37392209F78",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/32?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74138"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99425E3B5AD373B733B963",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/33?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74151"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile4.uf.tistory.com/image/99DFA6335AD373E639E897",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/34?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74153"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile9.uf.tistory.com/image/99D0C23D5AD374130EE840",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/35?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 
                                        
                                        
                                    elsif content == "74164"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/990720405AD3743C291313",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/36?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "74169"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/99C6B93A5AD3746E0BE1E8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/37?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "74390"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile10.uf.tistory.com/image/9943F3385AD374A028336F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/38?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "1N4001"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99B25E4E5AD5F7271E02D7",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/69?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "1N4002"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99D3B6435AD5F74618B489",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/70?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "2N2222"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/99122E445AD5F79D05E141",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/72?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "CA3046"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile6.uf.tistory.com/image/99179E445AD5F7BA37DD0B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/73?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "CD4007"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/99E9A44C5AD5F7D525F3B2",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/74?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "MC1447UB"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/9944734B5AD5F7F228D4DA",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/75?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                      
                                        

                                    elsif content == "FND507(7segment)"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99FC68385AD374D009FFBE",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/39?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "LM555(timer)"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99C4A3335AD375102884E9",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/40?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "LM741"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99673B3A5AD3754D07A3D6",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/41?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                    elsif content == "8p Dip Switch"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/9977F8405AD3757D262AD9",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/42?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                    elsif content == "라즈베리파이"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/99C3F5505AD4F97B222553",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/66?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                     elsif content == "아두이노"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/9945E34C5AD4FB0F22C434",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/67?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "검색(AllDataSheet)"
                                        msg = {
                                          message: {
                                            message_button: {
                                              "label": "AllDataSheet 이동",
                                              "url": "http://www.alldatasheet.co.kr"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                                                            
                                        

                                        
        elsif content == "사용법"
            msg = {
              message: {
                text: "원하는 사용법을 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons: use_menu
              }
            }
            render json: msg, status: :ok              
            
            
                                    elsif content == "저항 읽는법"
                                        msg = {
                                          message: {
                                            "text":"1Ω 갈흑금금 3.3Ω 주주금금\n10Ω 갈흑흑금 330Ω 주주갈금\n470Ω 황보갈금 560Ω 녹청갈금
                                            \n1KΩ 갈흑적금 1.8KΩ 갈회적금\n2KΩ 적흑적금 2.2KΩ 적적적금\n3.3KΩ 주주적금 4.7KΩ 황보적금
                                            \n5.6KΩ 녹청적금 6.8KΩ 청회적금\n10KΩ 갈흑주금 15KΩ 갈녹주금\n20KΩ 적흑주금 33KΩ 주주주금
                                            \n47KΩ 황보주금 51KΩ 녹갈주금\n140KΩ 갈황황금 390KΩ 주백황금",
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/995D30425AD4EB8911F13A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/60?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok          
            

                                    elsif content == "커패시터 읽는법"
                                        msg = {
                                          message: {
                                            text:"0.01[uF] = 103\n0.047[uF] = 473\n0.47[uF] = 474\n3.5[uF] = 355\n4.7[uF] = 475",
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/995A59395AD4F06D187797",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/62?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "인덕터 읽는법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/9970A33B5AD4EE5E16CAE8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/61?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  


                                    elsif content == "브래드보드 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile30.uf.tistory.com/image/99F6744F5AD4F28C168D8A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/63?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "가변저항 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/996EA8475AD4F4741F956A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/64?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "함수발생기 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99B511395AD5FCE536197B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "오실로스코프 사용법(작성중)"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99B511395AD5FCE536197B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "테스터기 사용법(작성중)"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99B511395AD5FCE536197B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  


                                    elsif content == "디지털 멀티미터 사용법(작성중)"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99B511395AD5FCE536197B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok              

                                    elsif content == "전원공급기 사용법(작성중)"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99B511395AD5FCE536197B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "납땜하는 방법(작성중)"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99B511395AD5FCE536197B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "피스파이스 사용법"
                                        msg = {
                                          message: {
                                            text: "피스파이스(Capture CIS) 실행 -> File-New Project -> Name 임의로설정 ->\
                                            Analog or Mixed A/D 선택 -> OK -> Create a blank project -> OK ->\
                                            화면나온상태에서 P누르면 -> Add Library -> PSpice폴더내의 라이브러리 모두선택후 열기
                                            \n
                                            *MOSFET(CA3046)\nPart에 검색 Q2N2222(아무BJT) -> OK -> 우클릭 - Edit PSpice Model ->\
                                            주어진 모델변수로 변경(ca3046)\n모델변수는 '자세히보기' 클릭",

                                            
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/991112445AD6051D2292B9",
                                              "width": 420,
                                              "height": 330
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/77?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                    elsif content == "MATLAB 사용법(작성중)"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99B511395AD5FCE536197B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok


                                        
        elsif content == "전자상식(추가중)"
            msg = {
              message: {
                text: "원하는 과목을 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons: formula_menu
              }
            }
            render json: msg, status: :ok    

                                    elsif content == "단위"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "https://ssl.pstatic.net/tveta/libs/1194/1194463/c4c85eed0e92f4049acf_20180412174814100.jpg",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "https://m.blog.naver.com"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok 
                                        
                                       




        elsif content == "랜덤정보(바뀜)"
            msg = {
              message: {
                text: random_reply
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok  




       

            
            
        elsif content == "충북대학교 어둠의게시판"
            msg = {
              message: {
                text:"cbnu.xyz",
                "photo": {
                       "url": "http://cfile25.uf.tistory.com/image/992DAB425AD521511EE54E" ,
                      "width": 720,
                      "height": 630
                   }
                    # "message_button": {
                    #   "label": "가즈아",     
                    #   "url": "leecapture18.iwinv.net/wp"
                    # }
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        else
            msg = {
              message: {
                  text: "잘못된 입력입니다.다시선택해주세요."
              },

              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
        end
    end

    
end
