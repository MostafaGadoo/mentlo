import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class YogaWidget extends StatelessWidget {
  const YogaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Yoga for better mental health',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0), // Set the desired border radius value
                  image: const DecorationImage(
                    image: AssetImage('assets/images/yoga_real.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [

                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '- A sharper brain',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'When you lift weights, your muscles get stronger and bigger. When you do yoga, your brain cells develop new connections, and changes occur in brain struc­ture as well as function, resulting in improved cog­nitive skills, such as learning and memory. Yoga strengthens parts of the brain that play a key role in memory, attention, awareness, thought, and language. Think of it as weightlifting for the brain.',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Studies using MRI scans and other brain imaging technology have shown that people who regularly did yoga had a thicker cerebral cortex (the area of the brain responsible for information processing) and hippocampus (the area of the brain involved in learn­ing and memory) compared with nonpractitioners. These areas of the brain typically shrink as you age, but the older yoga practitioners showed less shrinkage than those who did no yoga. This suggests that yoga may counteract age-related declines in memory and other cognitive skills',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Research also shows that yoga and meditation may improve executive functions, such as reasoning, decision making, memory, learning, reac­tion time, and accuracy on tests of mental acuity.',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '- Improved mood and reduced anxiety',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'All exercise can boost your mood by lowering levels of stress hormones, increasing the production of feel-good chemicals known as endorphins, and bringing more oxygenated blood to your brain. But yoga may have additional ben­efits. It can affect mood by elevating levels of a brain chemical called gamma-aminobutyric acid (GABA), which is associated with better mood and decreased anxiety.',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Meditation also reduces activity in the limbic system—the part of the brain dedicated to emotions. As your emotional reac­tivity diminishes, you have a more tempered response when faced with stressful situations.',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Drugs and talk therapy have traditionally been the go-to remedies for depression and anxiety. But complementary approaches, such as yoga, also helps, and yoga stacks up well when compared with other complementary therapies.',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      'A review of 15 studies, published in the jour­nal Aging and Mental Health, looked at the effect of a variety of relaxation techniques on depression and anxiety in older adults. In addition to yoga, interven­tions included massage therapy, progressive muscle relaxation, stress management, and listening to music. While all the techniques provided some benefit, yoga and music were the most effective for both depression and anxiety. And yoga appeared to provide the lon­gest-lasting effect.',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
