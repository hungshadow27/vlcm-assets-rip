package com.tgame.moudels.Item.controller
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.FFAlert;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Item_ItemUseCommand extends SimpleCommand
   {
      
      public function Item_ItemUseCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var useIT:Function;
         var liheOpenComplete:Function;
         var selectMainStatusComplete:Function;
         var selectMainStatusComplete1:Function;
         var selectMainStatusComplete2:Function;
         var openBaoXiang:Function;
         var usable:Function;
         var usable2:Function;
         var useFun:Function;
         var onMoveArrived:Function;
         var onMoveUnable:Function;
         var onMoveArrived1:Function;
         var onMoveUnable1:Function;
         var onMoveArrived2:Function;
         var onMoveUnable2:Function;
         var onMoveArrived3:Function;
         var onMoveUnable3:Function;
         var onMoveArrived4:Function;
         var onMoveUnable4:Function;
         var onMoveArrived5:Function;
         var onMoveUnable5:Function;
         var onMoveArrived6:Function;
         var onMoveUnable6:Function;
         var onMoveArrived7:Function;
         var onMoveUnable7:Function;
         var onMoveArrived8:Function;
         var onMoveUnable8:Function;
         var sender:Item_MsgSenderProxy = null;
         var itemFace:ItemFace = null;
         var good:Goods = null;
         var mount:PureMount = null;
         var selectGameComplete:Function = null;
         var r:Array = null;
         var morey:int = 0;
         var callBack:MoveCallBack = null;
         var path:String = null;
         var type:int = 0;
         var $note:INotification = param1;
         sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         var arr:Array = $note.getBody() as Array;
         itemFace = arr[0] as ItemFace;
         var isUseNow:int = int(arr[1]);
         good = itemFace.getItem() as Goods;
         if(isUseNow == 0 && SpecialGoodsID.isOpenPanelGoods(good.id))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_GOODS_PANEL,good);
         }
         else
         {
            useIT = function():void
            {
               var _loc1_:int = good.position;
               var _loc2_:int = good.id;
               TCursorManager.resumFullMouse();
               ExchangePositionManager.checkUseDrugSound(good);
               var _loc3_:Boolean = openPanel(_loc2_);
               if(!_loc3_)
               {
                  sender.send_11201([_loc2_,_loc1_]);
               }
            };
            if(good.res.kind == GoodsKind.K2 && ItemPositionRange.inMountBody(good.res.position))
            {
               mount = GameInstance.mainCharData.mountInfo.currentMount;
               if(!mount)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您当前没有骑乘坐骑"));
                  return;
               }
               if(good.quality >= 4 && good.bind == 0)
               {
                  FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,good.res.position,ItemPositionRange.CONTAINER_MOUNT,mount.id]);
                     }
                  },true);
               }
               else
               {
                  sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,good.res.position,ItemPositionRange.CONTAINER_MOUNT,mount.id]);
               }
            }
            else if(good.res.kind == GoodsKind.K2)
            {
               if(good.res.position == ItemPositionRange.GOODS_IN_MEIREN_RANGE.x)
               {
                  sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,0,ItemPositionRange.CONTAINER_GIRL,GameInstance.mainCharData.girlInfo.selectedGirlID]);
               }
               else if((good.quality >= 4 || ItemPositionRange.isYueNanZhuangBeiByPosition(good.res.position) || ItemPositionRange.isYueNanZhuangBeiByID(good.id)) && good.bind == 0)
               {
                  FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                     }
                  },true);
               }
               else
               {
                  sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
               }
            }
            else if(good.id == SpecialGoodsID.JUBAOPEN_ID)
            {
               FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("确定投入1元宝和1个聚宝盆兑换100个活动金元宝？") + "</font>","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     useIT();
                  }
               },true);
            }
            else if(good.id == SpecialGoodsID.ZUOQI_SHEN_DAN)
            {
               FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("坐骑神丹将被当前出战坐骑食用，确定使用坐骑神丹吗？") + "</font>","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     useIT();
                  }
               },true);
            }
            else if(SpecialGoodsID.YN_SPECIALBOX_ARR.indexOf(good.id) != -1)
            {
               FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("是否确定消耗400YB打开宝箱？") + "</font>","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     useIT();
                  }
               },true);
            }
            else if(good.id == SpecialGoodsID.QINGRENJIE_JINGXI_LIHE)
            {
               liheOpenComplete = function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     useIT();
                  }
               };
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("花费48元宝开启情人节礼盒可以获得:龙兽筋X516，您确定吗") + "？" + "</font>","",2,liheOpenComplete);
            }
            else if(good.id == SpecialGoodsID.SHEN_MI_LIAN_GU_LI_HE)
            {
               selectMainStatusComplete = function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
                     FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                     FAlert.show(LanResManager.getLanCommonTextWords("选择领取200个炼骨丹玩家将无法参与炼骨丹兑换神奇炼骨丹的活动，您确定吗") + "？","",2,selectGameComplete);
                  }
                  else
                  {
                     sender.send_53059({
                        "type":1,
                        "id":SpecialGoodsID.SHEN_MI_LIAN_GU_LI_HE
                     });
                  }
               };
               selectGameComplete = function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     sender.send_53059({
                        "type":0,
                        "id":SpecialGoodsID.SHEN_MI_LIAN_GU_LI_HE
                     });
                  }
               };
               FAlert.okLabel = LanResManager.getLanCommonTextWords("马上免费领取个炼骨丹");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("使用元宝马上免费领取个炼骨丹");
               FAlert.show("                    " + LanResManager.getLanCommonTextWords("请谨慎选择优惠活动哦，选择后将无法重新选择哦！") + "                    ","",2,selectMainStatusComplete);
            }
            else if(good.id == SpecialGoodsID.SHEN_MI_BA_GU_LI_HE)
            {
               selectMainStatusComplete1 = function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     sender.send_53059({
                        "type":0,
                        "id":SpecialGoodsID.SHEN_MI_BA_GU_LI_HE
                     });
                  }
                  else
                  {
                     sender.send_53059({
                        "type":1,
                        "id":SpecialGoodsID.SHEN_MI_BA_GU_LI_HE
                     });
                  }
               };
               FAlert.okLabel = LanResManager.getLanCommonTextWords("使用元宝提取个八骨丹及八骨惊喜宝箱");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("使用元宝提取个八骨丹");
               FAlert.show("                          " + LanResManager.getLanCommonTextWords("请谨慎选择优惠活动哦，选择后将无法重新选择哦！") + "                    \n             " + LanResManager.getLanCommonTextWords("活动结束后，八骨丹都将会失效，请广大玩家及时使用，以免造成损失") + "          ","",2,selectMainStatusComplete1);
            }
            else if(good.id == SpecialGoodsID.SHEN_MI_FU_DAI)
            {
               selectMainStatusComplete2 = function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FFAlert.OK)
                  {
                     sender.send_53059({
                        "type":0,
                        "id":SpecialGoodsID.SHEN_MI_FU_DAI
                     });
                  }
                  else if(param1.eventData == FFAlert.OK2)
                  {
                     sender.send_53059({
                        "type":1,
                        "id":SpecialGoodsID.SHEN_MI_FU_DAI
                     });
                  }
                  else if(param1.eventData == FFAlert.OK3)
                  {
                     sender.send_53059({
                        "type":2,
                        "id":SpecialGoodsID.SHEN_MI_FU_DAI
                     });
                  }
               };
               FFAlert.show("<font color=\'#FF0000\'>" + LanResManager.getLanCommonTextWords("你可以选择使用48元宝兑换炼骨丹（绑）X508，使用48元宝兑换碧灵丹（绑）X508或直接兑换神奇宝箱（绑）X2") + "</font>\n","",selectMainStatusComplete2);
            }
            else if(good.id == SpecialGoodsID.SHEN_MI_BAO_XIANG || good.id == SpecialGoodsID.BAI_YIN_BAO_XIANG || good.id == SpecialGoodsID.QING_TONG_BAO_XIANG)
            {
               r = [18,0,2,8];
               morey = good.id - 7581;
               if(r[morey] == 0)
               {
                  useIT();
               }
               else
               {
                  openBaoXiang = function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        useIT();
                     }
                  };
                  FAlert.show(LanResManager.getLanCommonTextWords("打开该宝箱需要消耗") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + r[morey] + "</font>" + LanResManager.getLanCommonTextWords("元宝，确定打开？"),"",2,openBaoXiang);
               }
            }
            else if(good.id == SpecialGoodsID.GONGJIANSHUXING_QIANGHUADAN)
            {
               usable = function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     useIT();
                  }
               };
               FAlert.show(LanResManager.getLanCommonTextWords("你确定使用") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("弓箭属性强化丹") + "</font>" + LanResManager.getLanCommonTextWords("吗？") + "<br><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("弓箭属性强化丹：可以将当前弓箭攻击和暴击属性永久提升两倍") + "<br>" + LanResManager.getLanCommonTextWords("超强弓箭属性强化丹：可以将当前弓箭攻击和暴击属性永久提升四倍") + "<br></font>","",2,usable);
            }
            else if(good.id == SpecialGoodsID.SUPER_GONGJIANSHUXING_QIANGHUADAN)
            {
               usable2 = function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     useIT();
                  }
               };
               FAlert.show(LanResManager.getLanCommonTextWords("你确定使用") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("超级弓箭属性强化丹") + "</font>" + LanResManager.getLanCommonTextWords("吗？") + "<br>" + LanResManager.getLanCommonTextWords("使用之后将不可以使用") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("弓箭属性强化丹。") + "</font><br><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("弓箭属性强化丹：可以将当前弓箭攻击和暴击属性永久提升两倍") + "<br>" + LanResManager.getLanCommonTextWords("超强弓箭属性强化丹：可以将当前弓箭攻击和暴击属性永久提升四倍") + "<br></font>","",2,usable2);
            }
            else if(good.id == SpecialGoodsID.QUANSHEN_SHENGXIANJIHUOSHI)
            {
               useFun = function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     useIT();
                  }
               };
               FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("请您把要升级的犬神佩戴在身上，犬神升仙激活石只能升级佩戴在身上的犬神，") + "<br>" + "请玩家妥善选择再点击确认，以免造成不必要的损失。" + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("您确定使用犬神升仙激活石吗？") + "</font>","",2,useFun);
            }
            else if(good.id == SpecialGoodsID.ZHENGGUDAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  sender.send_73135(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(good.id == SpecialGoodsID.DOUDIZHUDAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  sender.send_73469(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(good.id == SpecialGoodsID.FEIBIAODAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  sender.send_73719(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(good.id == SpecialGoodsID.QINGSHUDAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  sender.send_74309(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(good.id == SpecialGoodsID.HUAYUDAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  sender.send_74311(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(good.id == 728901)
            {
               onMoveArrived = function(param1:SceneCharacter, param2:MapTile):void
               {
                  sender.send_83075(1);
                  SmallLoadingBar.showLoading("",30 * 1000);
               };
               onMoveUnable = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable;
               callBack.onMoveArrived = onMoveArrived;
               MainCharSeachPathManager.mainCharWalk(20002 + "," + 36 + "," + 132 + "," + 0,false,callBack);
            }
            else if(good.id == 729084)
            {
               onMoveArrived1 = function(param1:SceneCharacter, param2:MapTile):void
               {
                  sender.send_83075(2);
                  SmallLoadingBar.showLoading("",30 * 1000);
               };
               onMoveUnable1 = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable1;
               callBack.onMoveArrived = onMoveArrived1;
               MainCharSeachPathManager.mainCharWalk(20212 + "," + 23 + "," + 13 + "," + 0,false,callBack);
            }
            else if(good.id == 729552 || good.id == 729586)
            {
               onMoveArrived2 = function(param1:SceneCharacter, param2:MapTile):void
               {
                  if(good.id == 729552)
                  {
                     sender.send_83075(3);
                  }
                  else if(good.id == 729586)
                  {
                     sender.send_83075(4);
                  }
                  SmallLoadingBar.showLoading("",10 * 1000);
               };
               onMoveUnable2 = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable2;
               callBack.onMoveArrived = onMoveArrived2;
               MainCharSeachPathManager.mainCharWalk(20002 + "," + 126 + "," + 151 + "," + 0,false,callBack);
            }
            else if(good.id == 730012)
            {
               onMoveArrived3 = function(param1:SceneCharacter, param2:MapTile):void
               {
                  sender.send_83075(5);
               };
               onMoveUnable3 = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable3;
               callBack.onMoveArrived = onMoveArrived3;
               MainCharSeachPathManager.mainCharWalk(20002 + "," + 35 + "," + 131 + "," + 0,false,callBack);
            }
            else if(good.id == 730210)
            {
               onMoveArrived4 = function(param1:SceneCharacter, param2:MapTile):void
               {
                  sender.send_83075(6);
               };
               onMoveUnable4 = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable4;
               callBack.onMoveArrived = onMoveArrived4;
               MainCharSeachPathManager.mainCharWalk(20009 + "," + 144 + "," + 85 + "," + 0,false,callBack);
            }
            else if(good.id == 730211)
            {
               onMoveArrived5 = function(param1:SceneCharacter, param2:MapTile):void
               {
                  sender.send_83075(7);
               };
               onMoveUnable5 = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable5;
               callBack.onMoveArrived = onMoveArrived5;
               MainCharSeachPathManager.mainCharWalk(20005 + "," + 30 + "," + 112 + "," + 0,false,callBack);
            }
            else if(good.id == 730212)
            {
               onMoveArrived6 = function(param1:SceneCharacter, param2:MapTile):void
               {
                  sender.send_83075(8);
               };
               onMoveUnable6 = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable6;
               callBack.onMoveArrived = onMoveArrived6;
               MainCharSeachPathManager.mainCharWalk(20015 + "," + 66 + "," + 12 + "," + 0,false,callBack);
            }
            else if(good.id == 730213)
            {
               onMoveArrived7 = function(param1:SceneCharacter, param2:MapTile):void
               {
                  sender.send_83075(9);
               };
               onMoveUnable7 = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable7;
               callBack.onMoveArrived = onMoveArrived7;
               MainCharSeachPathManager.mainCharWalk(20250 + "," + 59 + "," + 56 + "," + 0,false,callBack);
            }
            else if(good.id == 730696 || good.id == 730697 || good.id == 730698 || good.id == 732162 || good.id == 732163 || good.id == 732164 || good.id == 739818)
            {
               onMoveArrived8 = function(param1:SceneCharacter, param2:MapTile):void
               {
                  if(good.id == 739818)
                  {
                     SmallLoadingBar.showLoading("",5000);
                  }
                  sender.send_83075(type);
               };
               onMoveUnable8 = function(param1:SceneCharacter, param2:MapTile):void
               {
               };
               switch(good.id)
               {
                  case 730696:
                  case 732162:
                     path = 20002 + "," + 53 + "," + 133 + "," + 0;
                     type = 11;
                     break;
                  case 730697:
                  case 732163:
                     path = 20002 + "," + 11 + "," + 118 + "," + 0;
                     type = 12;
                     break;
                  case 730698:
                  case 732164:
                     path = 20002 + "," + 11 + "," + 118 + "," + 0;
                     type = 13;
                     break;
                  case 739818:
                     path = 20002 + "," + 12 + "," + 119 + "," + 0;
                     type = 14;
               }
               callBack = new MoveCallBack();
               callBack.onMoveUnable = onMoveUnable8;
               callBack.onMoveArrived = onMoveArrived8;
               MainCharSeachPathManager.mainCharWalk(path,false,callBack);
            }
            else if(good.id == 730635 && GameInstance.scene.mapConfig.mapID == 20028)
            {
               sender.send_83075(10);
               SmallLoadingBar.showLoading("Đang Săn Quà 2019",15000);
            }
            else
            {
               useIT();
            }
         }
      }
      
      private function openPanel(param1:int) : Boolean
      {
         var _loc3_:RidePanel = null;
         var _loc4_:CharAttribute = null;
         var _loc2_:Boolean = false;
         switch(param1)
         {
            case 1007:
               _loc3_ = new RidePanel();
               if(!Fun.isVisible(_loc3_))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE);
               }
               GameInstance.uiInstance.ridePanel.onTabClick(null,LanResManager.getLanCommonTextWords("潜力"));
               _loc2_ = true;
               break;
            case 1008:
            case 1009:
               _loc3_ = new RidePanel();
               if(!Fun.isVisible(_loc3_))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE);
               }
               GameInstance.uiInstance.ridePanel.onTabClick(null,LanResManager.getLanCommonTextWords("进阶"));
               _loc2_ = true;
               break;
            case 1010:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("经脉"));
               _loc2_ = true;
               break;
            case 1222:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("肉身"));
               _loc2_ = true;
               break;
            case 1227:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("弓箭"));
               _loc2_ = true;
               break;
            case 1229:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("丹田"));
               _loc2_ = true;
               break;
            case 1230:
               _loc3_ = new RidePanel();
               if(!Fun.isVisible(_loc3_))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE);
               }
               GameInstance.uiInstance.ridePanel.onTabClick(null,LanResManager.getLanCommonTextWords("通灵"));
               _loc2_ = true;
               break;
            case 1231:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("独孤九剑"));
               _loc2_ = true;
               break;
            case 1315:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("八卦掌"));
               _loc2_ = true;
               break;
            case 1316:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("九阳神功"));
               _loc2_ = true;
               break;
            case 1318:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanTextWords(CharAttribute,"境界"));
               _loc2_ = true;
               break;
            case 2042:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("降龙十八掌"));
               _loc2_ = true;
               break;
            case 2043:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("洗髓经"));
               _loc2_ = true;
               break;
            case 2044:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("飞龙探云手"));
               _loc2_ = true;
               break;
            case 2045:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("九阴真经"));
               _loc2_ = true;
               break;
            case 2049:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("五形拳"));
               _loc2_ = true;
               break;
            case 2050:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("十八铜人阵"));
               _loc2_ = true;
               break;
            case 2051:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("六脉神剑"));
               _loc2_ = true;
               break;
            case 2053:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("金钟罩"));
               _loc2_ = true;
               break;
            case 2054:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("修行"));
               _loc2_ = true;
               break;
            case 2056:
            case 2057:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("太玄神功"));
               _loc2_ = true;
               break;
            case 2058:
            case 2059:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("北冥神功"));
               _loc2_ = true;
               break;
            case 2061:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("神照经"));
               _loc2_ = true;
               break;
            case 2063:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("七伤拳"));
               _loc2_ = true;
               break;
            case 2064:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("紫霞神功"));
               _loc2_ = true;
               break;
            case 2066:
               _loc4_ = new CharAttribute();
               if(!Fun.isVisible(GameInstance.uiInstance.charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               GameInstance.uiInstance.charAttribute.onButtonClick(null,LanResManager.getLanCommonTextWords("奇门阵"));
               _loc2_ = true;
               break;
            default:
               _loc2_ = false;
         }
         return _loc2_;
      }
   }
}

