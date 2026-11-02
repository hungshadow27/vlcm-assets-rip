package com.tgame.moudels.biwuzhaoqin.controller
{
   import com.tgame.moudels.biwuzhaoqin.BiWuZhaoQin_ApplicationFacade;
   import com.tgame.moudels.biwuzhaoqin.model.BiWuZhaoQin_MsgReceivedProxy;
   import com.tgame.moudels.biwuzhaoqin.model.BiWuZhaoQin_MsgSenderProxy;
   import com.tgame.moudels.biwuzhaoqin.view.BiWuZhaoQin_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BiWuZhaoQin_StartupCommand extends SimpleCommand
   {
      
      public function BiWuZhaoQin_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerCommand(BiWuZhaoQin_ApplicationFacade.QIANG_XIUQIU,BiWuZhaoQin_QiangXiuQiuCommand);
         facade.registerProxy(new BiWuZhaoQin_MsgReceivedProxy());
         facade.registerProxy(new BiWuZhaoQin_MsgSenderProxy());
         facade.registerMediator(new BiWuZhaoQin_Mediator());
      }
   }
}

