/* child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Expanded(child: Image.asset(widget.project.imagePath, fit: BoxFit.cover)),
            SizedBox(height: s.spaceBtwItems),

            Text(widget.project.title, style: fonts.titleMedium),
            const SizedBox(height: 6),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.description,
                        style: fonts.labelMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: s.spaceBtwItems),

                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('View Project', style: fonts.labelMedium.rubik(color: DColors.primaryButton)),
                  ),
                ),
              ],
            ),
          ],
        ),*/