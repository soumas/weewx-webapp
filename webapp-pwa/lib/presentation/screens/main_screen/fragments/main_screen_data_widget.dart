import 'package:flutter/material.dart';

import 'package:weewx_pwa/presentation/screens/main_screen/fragments/headline_row.dart';
import 'package:weewx_pwa/presentation/screens/main_screen/fragments/image_viewer.dart';
import 'package:weewx_pwa/presentation/screens/main_screen/fragments/weather_data_table.dart';
import 'package:weewx_pwa/presentation/screens/main_screen/fragments/weather_graphs.dart';
import 'package:weewx_pwa/presentation/widgets/responsive_container.dart';
import 'package:weewx_pwa/util/responsive_utils.dart';

class MainScreenDataWidget extends StatelessWidget {
  const MainScreenDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // headline for not small screen (above image)
        if (ScreenSizeExt.of(context) != ScreenSize.small)
          const ResponsiveContainer(
            child: HeadlineRow(),
          ),
        // image for small screen (without padding)
        if (ScreenSizeExt.of(context) == ScreenSize.small)
          const ResponsiveContainer(
            noPaddingForLowestBreakpoint: true,
            child: ImageViewer(),
          ),
        // image for medium screen (without padding)
        if (ScreenSizeExt.of(context) == ScreenSize.medium)
          const ResponsiveContainer(
            child: ImageViewer(),
          ),
        // image and weather table for large screen
        if (ScreenSizeExt.of(context) == ScreenSize.large)
          ResponsiveContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenSizeExt.contentWidthOf(context) * 0.65,
                  child: const ImageViewer(),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: WeatherDataTable(),
                  ),
                ),
              ],
            ),
          ),
        // headline for small screen (below image)
        if (ScreenSizeExt.of(context) == ScreenSize.small)
          const ResponsiveContainer(
            child: HeadlineRow(),
          ),
        // spacer before weather data table
        if (ScreenSizeExt.of(context) != ScreenSize.large)
          const SizedBox(
            height: 30,
          ),
        // weather table for non large screen
        if (ScreenSizeExt.of(context) != ScreenSize.large)
          const ResponsiveContainer(
            child: WeatherDataTable(),
          ),
        // spacer before graphs
        const SizedBox(
          height: 30,
        ),
        // graphs
        const ResponsiveContainer(
          child: WeatherGraphs(images: [
            'http://localhost/weewx/webapp/dayhum.png',
            'http://localhost/weewx/webapp/dayhum.png',
            'http://localhost/weewx/webapp/dayrain.png',
            'http://localhost/weewx/webapp/dayrain.png',
            'http://localhost/weewx/webapp/dayhum.png',
          ]),
        ),
        // bottom spacer
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
